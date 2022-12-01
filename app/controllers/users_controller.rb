class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def profile
    @user = User.find(params[:id])
    @registrations = @user.registrations
    @created_events = @user.events
    @attended_events = @user.attended_events
  end
end
