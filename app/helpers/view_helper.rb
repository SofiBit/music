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
      song.gsub!(/&.+/, '')
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

  def playlists(current_user, playlists)
    return playlists if current_user.playlists == playlists

    playlists.public_playlists
  end

  def user_name(user)
    return user.nickname if user.nickname.present?

    "#{user.first_name} #{user.last_name}"
  end

  def find_subscription(user)
    UserSubscription.find_by(subscription: user)
  end

  def open_chat(current_user, user)
    return if current_user == user

    room = Room.find_room(current_user, user)
    return button_to t('app.open_chat'), room_path(room), method: :get, class: 'btn btn-secondary' if room.present?

    button_to t('app.open_chat'), rooms_path(room: { name: "#{user_name(current_user)} - #{user_name(@user)}" }, user: @user)
  end

  def render_if_page_nil(page)
    return unless page.empty?

    render 'links/top_tracks'
  end

  def current_user_message?(user, message)
    user == message.user
  end

  def get_image_playlist(playlist_id)
    playlist = Playlist.find(playlist_id)
    playlist.image
  end

  def get_image_user(user_id)
    user = User.find(user_id)
    user.avatar
  end
end
