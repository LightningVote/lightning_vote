module Admin
  class EventsController < ApplicationController

    def index
      @events = current_user.events
    end

    def new
      @event = Event.new
    end

    def create
      @event = current_user.create_event(event_creation_params)
      if @event.valid?
        redirect_to new_admin_event_url
      else
        flash[:notice] = "Unable to save event"
        render :new
      end
    end

    def edit
      @event = Event.find(params[:id])
    end

    def update
      @event = Event.find(params[:id])
      if @event.update_attributes(event_creation_params)
        redirect_to new_admin_event_url
      else
        flash[:notice] = "Unable to update event"
        render :edit
      end
    end
    private
    def event_creation_params
      params.require(:event).permit(:title, :description, :date, :start_time)
    end
    def current_user
      # this is here because rspec doubles are verifying. This will eventually be implemented with the actual logged in user when we have logged in users
      User.find(session[:current_user_id])
    end
  end
end
