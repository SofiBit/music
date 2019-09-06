# frozen_string_literal: true

class LinksController < ApplicationController
  include ProvidersLinksFetch
  include UsersTrack
  include ServiceObjects

  def index; end

  def show
    link = params[:source_link]
    generate_links_info(link)
    saving_tracks(link)
    respond_to do |format|
      format.js
      format.json { render json: @result.to_json }
    end
  end
  def saving_tracks(link)

    if generate_success?(link)
      track_to_user(link, @result, current_user)
      current_user.friends.each do |friend|
        friend.events.create(message: "#{current_user.first_name} \
          #{current_user.last_name} added a new track")
      end
    end
  end
end
