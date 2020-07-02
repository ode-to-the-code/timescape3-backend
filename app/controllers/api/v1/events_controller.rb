class Api::V1::EventsController < ApplicationController

  def index
    events = Event.all
    # render json: events
    # options = {
    #   include: [:user]
    # }
    render json: EventSerializer.new(events)
  end


  def create
    event = Event.new(event_params)
    if event.save
      render json: event, status: :accepted
    else
      render json: {error: event.errors.full_messages}, status: :unprocessable_entity
    end
  end


  private

  def event_params
    params.require(:event).permit(:name, :description, :startdate, :user_id)
  end
end
