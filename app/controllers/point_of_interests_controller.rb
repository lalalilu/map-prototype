class PointOfInterestsController < ApplicationController
  def show
    @poi = PointOfInterest.find(params[:id])
  end
end
