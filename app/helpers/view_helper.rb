module ViewHelper
  def share_telegram(result)
    image_tag(ENV['URI_IMG_TELEGRAM'],
     onclick: "shareTelegram('#{ENV['URI_APP']}', '#{transform_links(result)}')",
     style: "cursor: pointer")
  end

  def share_email(result)
    image_tag(ENV['URI_IMG_GMAIL'],
     onclick: "shareEmail('#{ENV['URI_APP']}', '#{transform_links(result)}')",
     style: "cursor: pointer")
  end

  def transform_links(result)
    provider_links = JSON.parse(result)
    array = []
    provider_links.each do |provider, song|
      array << "#{provider.capitalize.gsub(/[_]/, ' ')}:%20#{song}"
    end
    array.join("%0A")
  end

  def bootstrap_class(name)
    { success: 'alert-success',
      error: 'alert-danger',
      danger: 'alert-danger',
      alert: 'alert-warning',
      notice: 'alert-info' }[name.to_sym] || name
  end

  def count_adding_track(track)
    track.adding_track_to_users.count
  end

  def top_tracks
    top_tracks = []
    Track.all.each_with_object(track_count = {}) do |track, count_adding|
      count_adding[track] = track.adding_track_to_users.count
    end
    10.times do
      top_tracks << track_count.key(track_count.values.max)
      track_count.delete(track_count.key(track_count.values.max))
    end
    top_tracks
  end

  def playlists(current_user, playlists)
    return playlists if current_user.playlists == playlists

    playlists.public_playlists
  end

  def user_name(user)
    "#{user.first_name} #{user.last_name}"
  end

  def find_subscription(user)
    UserSubscription.find_by(subscription: user)
  end
end
