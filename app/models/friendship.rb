class Friendship < ApplicationRecord
  after_create_commit { create_notice_about_subscription }
  after_destroy { create_notice_about_unsubscription }

  belongs_to :user
  belongs_to :friend, class_name: 'User', foreign_key: 'friend_id'

  private

  def create_notice_about_subscription
    friend.notifications.create(message: "#{user.first_name} #{user.last_name} subscribed on you", sender: user)
  end

  def create_notice_about_unsubscription
    friend.notifications.create(message: "#{user.first_name} #{user.last_name} unsubscribed on you", sender: user)
  end
end
