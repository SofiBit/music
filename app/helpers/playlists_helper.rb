# frozen_string_literal: true

module PlaylistsHelper
  def top_playlists
    top_playlists = []
    Playlist.all.each_with_object(playlist_count = {}) do |playlist, count_subscriptions|
      count_subscriptions[playlist] = playlist.subscribers.count
    end
    playlist_count.select! { |playlist, count_subscribers| count_subscribers > 0 }
    10.times do
      top_playlists << playlist_count.key(playlist_count.values.max)
      playlist_count.delete(playlist_count.key(playlist_count.values.max))
    end
    top_playlists.compact!
  end
end
