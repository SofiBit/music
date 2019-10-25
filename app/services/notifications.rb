# frozen_string_literal

module Notifications

  def checked_notifications(user)
    user.notifications.new_notifications.each do |notification|
      notification.update(checked: true)
    end
  end

  def create_notice_about_new_playlist(user, playlist)
    user.followers.each do |follower|
      follower.notifications.create(message: "#{user.first_name} created\
        new playlist #{self.title}", sender: user,
        link: "/users/#{user.id}/playlists/#{playlist.id}")
    end
  end

  def create_notice_about_subscription_on_user(subscription, user)
    subscription.notifications.create!(message: "#{user.first_name}\
       #{user.last_name} subscribed on you", sender: user,
        link: "/users/#{user.id}")
  end

  def create_notice_about_unsubscription_from_user(subscription, user)
    subscription.notifications.create!(message: "#{user.first_name}\
       #{user.last_name} unsubscribed on you", sender: user,
        link: "/users/#{user.id}")
  end

  def create_notice_about_subscription_on_playlist(playlist, user)
    playlist.user.notifications.create(message: "#{user.first_name} \
      #{user.last_name} subscribed on the playlist #{playlist.title}",
      sender: user, link: "/users/#{user.id}")
  end

  def create_notice_about_unsubscription_from_playlist(playlist, user)
    playlist.user.notifications.create(message: "#{user.first_name} \
      #{user.last_name} unsubscribed from the playlist #{playlist.title}",
      sender: user, link: "/users/#{user.id}")
  end

  def create_notice_about_new_track(user)
    user.followers.each do |follower|
      follower.notifications.create(message: "#{user.first_name} added new track", sender: user)
    end
  end

  def create_notice_about_new_song(playlist, track)
    users(playlist).each do |user|
      user.notifications.create(message: "#{playlist.user.first_name} added a \
        new track to the playlist #{playlist.title}", sender: playlist.user,
        link: "/tracks/#{track.id}?playlist_id=#{playlist.id}")
    end
  end

  def users(playlist)
    playlist.subscribers + playlist.user.followers
  end
end
