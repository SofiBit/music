# frozen_string_literal: true

class LinksController < ApplicationController
  include ProvidersLinksFetch
  include SaveTrack
  include ServiceObjects

  def index; end

  def show
    link = params[:source_link]
    generate_links_info(link)
    @track = save_track(@result) if generate_success?(link)
    # TODO: @lyrics = GetLyrics.run(artist: @track.artist, track: @track.name)
    respond_to do |format|
      format.js
      format.json { render json: @result.to_json }
    end
  end
end
