class UserSubscription < ApplicationRecord
  after_create_commit { create_notice_about_subscription }
  after_destroy { create_notice_about_unsubscription }

  belongs_to :user
  belongs_to :subscription, class_name: 'User', foreign_key: 'subscription_id'

  private

  def create_notice_about_subscription
    subscription.notifications.create!(message: "#{user.first_name}\
       #{user.last_name} subscribed on you", sender: user)
  end

  def create_notice_about_unsubscription
    subscription.notifications.create!(message: "#{user.first_name}\
       #{user.last_name} unsubscribed on you", sender: user)
  end
end
