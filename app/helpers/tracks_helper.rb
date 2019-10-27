
module TracksHelper
  def private_for_playlist?(track, playlist)
    adding_track_to_playlist = track_playlist(track, playlist)
    adding_track_to_playlist.private?
  end

  def track_playlist(track, playlist)
    track.adding_tracks.find_by(playlist: playlist)
  end

  def tracks(current_user, playlist)
    return playlist.tracks.reverse if current_user && current_user.playlists.include?(playlist)

    playlist.public_tracks.reverse
  end
end
