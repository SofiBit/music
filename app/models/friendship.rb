class Friendship < ApplicationRecord
  after_create_commit { create_event_about_subscription }
  after_destroy { create_event_about_unsubscription }

  belongs_to :user
  belongs_to :friend, class_name: 'User', foreign_key: 'friend_id'

  private

  def create_event_about_subscription
    friend.events.create(message: "#{user.first_name} #{user.last_name} subscribed on you")
  end

  def create_event_about_unsubscription
    friend.events.create(message: "#{user.first_name} #{user.last_name} unsubscribed on you")
  end
end
