class PointOfInterestsController < ApplicationController
  before_action :authenticate_user!

  def show
    @point_of_interes = PointOfInterest.find(params[:id])
  end
end
