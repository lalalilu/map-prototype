class TripsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @trips = Trip.all
  end

  def show

  end
end
