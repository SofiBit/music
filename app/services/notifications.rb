# frozen_string_literal

module Notifications

  def checked_notifications(user)
    user.notifications.new_notifications.each do |notification|
      notification.update(checked: true)
    end
  end

  def create_notice_about_new_playlist(user, playlist)
    user.followers.each do |follower|
      follower.notifications.create(message: "notifications.new_playlist",
        sender: user, link: "/users/#{user.id}/playlists/#{playlist.id}")
    end
  end

  def create_notice_about_subscription_on_user(subscription, user)
    subscription.notifications.create!(message: "notifications.subscription_on_user",
       sender: user, link: "/users/#{user.id}")
  end

  def create_notice_about_unsubscription_from_user(subscription, user)
    subscription.notifications.create!(message: "notifications.unsubscription_from_user",
      sender: user, link: "/users/#{user.id}")
  end

  def create_notice_about_subscription_on_playlist(playlist, user)
    playlist.user.notifications.create(message: "notifications.subscription_on_playlist",
      sender: user, link: "/users/#{user.id}")
  end

  def create_notice_about_unsubscription_from_playlist(playlist, user)
    playlist.user.notifications.create(message: "notifications.unsubscription_from_playlist",
      sender: user, link: "/users/#{user.id}")
  end

  def create_notice_about_new_track(user)
    user.followers.each do |follower|
      follower.notifications.create(message: "notifications.added_track", sender: user)
    end
  end

  def create_notice_about_new_song(playlist, track)
    users(playlist).each do |user|
      user.notifications.create(message: "notifications.added_track_to_playlist", sender: playlist.user,
        link: "/tracks/#{track.id}?playlist_id=#{playlist.id}")
    end
  end

  def users(playlist)
    playlist.subscribers + playlist.user.followers
  end
end
