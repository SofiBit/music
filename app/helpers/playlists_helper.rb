# frozen_string_literal: true

module PlaylistsHelper
  def top_playlists
    top_playlists = []
    Playlist.public_playlists.each_with_object(playlist_count = {}) do |playlist, count_subscriptions|
      count_subscriptions[playlist] = playlist.subscribers.count
    end
    playlist_count.select! { |playlist, count_subscribers| count_subscribers > 0 }
    10.times do
      top_playlists << playlist_count.key(playlist_count.values.max)
      playlist_count.delete(playlist_count.key(playlist_count.values.max))
    end
    top_playlists.compact!
  end

  def owner?(user, playlist)
    playlist.user == user
  end

  def playlist_message(owner, user)
    return t('app.you_have_not_playlist') if user == owner

    "#{user_name(owner)}" + t('app.user_have_not_playlist')
  end
end
