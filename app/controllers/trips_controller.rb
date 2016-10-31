class TripsController < ApplicationController
  before_action :authenticate_user!

  def index
    @trips = Trip.all
  end

  def show
    @trip = Trip.find(params[:id])
    @point_of_interest = PointOfInterest.new
  end

  def new
    @trip = Trip.new
  end

  def create
    @trip = current_user.trips.create(trip_params)
    if @trip.valid?
      redirect_to trip_path(@trip)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def trip_params
    params.require(:trip).permit(:name)
  end


end
