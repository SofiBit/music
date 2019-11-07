# frozen_string_literal: true

class LinksController < ApplicationController
  include ProvidersLinksFetch
  include SaveTrack
  include ServiceObjects

  def index; end

  def show
    link = params[:source_link]
    if Track.exist_track?(link)
      generate_links_info(link)
      @track = save_track(@result, link) if generate_success?(link)
    else
      @track = Track.find_track(link)
    end
    # TODO: @lyrics = GetLyrics.run(artist: @track.artist, track: @track.name)
    respond_to do |format|
      format.js
      format.json { render json: @result.to_json }
    end
  end
end
