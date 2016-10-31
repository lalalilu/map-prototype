class UsersController < ApplicationController

  def show
    @trips = Trip.all
    @user = User.find(params[:id])
  end

end
