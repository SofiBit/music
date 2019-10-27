class SearchController < ApplicationController
  def index
    @results = results
    respond_to do |format|
      format.js
    end
  end

  private

  def results
    user_result = User.search(params[:query])
    playlist_result = Playlist.search_public(params[:query])
    track_result = Track.search(params[:query])
    tag_result = Tag.search(params[:query])
    checking([user_result, playlist_result, track_result, tag_result])
  end

  def checking(results)
    results.select { |result| result.size > 0 }
  end
end
