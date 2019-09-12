# frozen_string_literal: true

class LinksController < ApplicationController
  include ProvidersLinksFetch
  include UsersTrack
  include ServiceObjects

  def index; end

  def show
    link = params[:source_link]
    generate_links_info(link)
    track_to_user(link, @result, current_user) if generate_success?(link)
    respond_to do |format|
      format.js
      format.json { render json: @result.to_json }
    end
  end
end
