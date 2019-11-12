# frozen_string_literal: true

module Search
  def results
    track_result = Track.search(params[:query])
    playlist_result = Playlist.search(params[:query])
    user_result = User.search(params[:query])
    checking(track_result, playlist_result, user_result)
  end

  def checking(*args)
    args.select { |result| result.size > 0 }
  end
end
