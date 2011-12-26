class EventsController < ApplicationController
  def create
    @event = current_user.events.new(params[:event])
    if @event.save
      flash[:success] = "Event added!"
    else
      flash[:error] = "There was a problem saving the event"
    end
    redirect_to root_path
  end

end
