class RegistrationsController < ApplicationController

  def create
    @user = User.find(params[:user_id])
    @event = Event.find(params[:event_id])
    @event.registrations.create(user: @user)
    redirect_to @event
  end

  def destroy
    user = User.find(params[:user_id])
    event = Event.find(params[:event_id])
    registration = user.registrations.find_by(event_id: event.id)
    registration.destroy

    redirect_to user_path(user)
  end
end
