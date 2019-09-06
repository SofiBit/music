class EventsController < ApplicationController

  def index
    @events = current_user.events.all.reverse
    current_user.events.each do |event|
      event.status = 'checked'
      event.save
    end
  end
end
