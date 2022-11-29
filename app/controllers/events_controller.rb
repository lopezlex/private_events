class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.user_id = current_user.id

    if @event.save
      redirect_to root_path, notice: "Event successfully created!"
    else
      render :new
    end
  end

private

  def event_params
    params.require(:event).
    permit(:name, :description, :location, :starts_at)
  end

end
