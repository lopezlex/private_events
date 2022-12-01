class RegistrationsController < ApplicationController

  def create
    @event = Event.find(params[:event_id])
    @event.registrations.create(user: current_user)
    redirect_to @event
  end

  def destroy
    registration = current_user.registrations.find(params[:id])
    registration.destroy

    event = Event.find_by(params[:event_id])
    redirect_to event
  end

end
