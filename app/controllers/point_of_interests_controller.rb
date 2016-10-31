class PointOfInterestsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :edit, :update, :destroy]

  def show
    @point_of_interest = PointOfInterest.find(params[:id])
  end

  def create
    @trip = Trip.find(params[:trip_id])
    @trip.point_of_interests.create(point_of_interest_params.merge(user: current_user))
    redirect_to trip_path(@trip)
  end

  def edit
    @trip = Trip.find(params[:trip_id])
    @point_of_interest = PointOfInterest.find(params[:id])
    if @point_of_interest.user != current_user
      render text: "Not Allowed", status: :unauthorized
    end
  end

  def update
    @point_of_interest = PointOfInterest.find(params[:id])
    if @point_of_interest.user != current_user
      render text: "Not Allowed", status: :forbidden
    end

    @point_of_interest.update_attributes(point_of_interest_params)
    if @point_of_interest.valid?
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @point_of_interest = PointOfInterest.find(params[:id])
    if @point_of_interest.user != current_user
      render text: "Not Allowed", status: :forbidden
    end

    @point_of_interest.destroy
    redirect_to root_path
  end

  private

  def point_of_interest_params
    params.require(:point_of_interest).permit(:name, :street, :city, :state, :zipcode)
  end
end
