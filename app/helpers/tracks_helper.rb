
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

  def top_tracks
    top_tracks = []
    Track.all.each_with_object(track_count = {}) do |track, count_adding|
      count_adding[track] = track.adding_track_to_users.count
    end
    10.times do
      top_tracks << track_count.key(track_count.values.max) unless track_count.values.max == 0
      track_count.delete(track_count.key(track_count.values.max))
    end
    top_tracks
  end
end
