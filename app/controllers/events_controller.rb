class EventsController < ApplicationController

  before_action :authenticate_user!, except: [:index]

  def index
    case params[:filter]
    when "past"
      @events = Event.past
    else
      @events = Event.upcoming
    end
  end

  def show
    @event = Event.find(params[:id])
    @attendees = @event.attendees

    if current_user
      @register = current_user.registrations.find_by(event_id: @event.id)
      # @invite = Registration.find_by(event_id: @event.id)
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])

    if @event.update(event_params)
      redirect_to @event
    else
      render :edit, status: :unprocessable_entity
    end
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

  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    redirect_to root_path, status: :see_other
  end

private

  def event_params
    params.require(:event).
    permit(:name, :description, :location, :starts_at, :status)
  end

end
