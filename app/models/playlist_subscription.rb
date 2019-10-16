class PlaylistSubscription < ApplicationRecord
  after_create_commit { create_notice_about_subscription }
  after_destroy { create_notice_about_unsubscription }

  belongs_to :playlist
  belongs_to :user

  private

  def create_notice_about_subscription
    playlist.user.notifications.create(message: "#{user.first_name} \
      #{user.last_name} subscribed on the playlist #{playlist.title}",
      sender: user, link: "users/#{user.id}")
  end

  def create_notice_about_unsubscription
    playlist.user.notifications.create(message: "#{user.first_name} \
      #{user.last_name} unsubscribed from the playlist #{playlist.title}",
      sender: user, link: "users/#{user.id}")
  end
end
