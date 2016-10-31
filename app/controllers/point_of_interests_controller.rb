class PointOfInterestsController < ApplicationController
  before_action :authenticate_user!

  def show
    @point_of_interest = PointOfInterest.find(params[:id])
  end

  def create
    @trip = Trip.find(params[:trip_id])
    @trip.point_of_interests.create(point_of_interest_params.merge(user: current_user))
    redirect_to trip_path(@trip)
  end

  private

  def point_of_interest_params
    params.require(:point_of_interest).permit(:name, :street, :city, :state, :zipcode)
  end
end
