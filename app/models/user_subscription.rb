class UserSubscription < ApplicationRecord
  include Notifications
  
  after_create_commit { create_notice_about_subscription_on_user(subscription, user) }
  after_destroy { create_notice_about_unsubscription_from_user(subscription, user) }

  belongs_to :user
  belongs_to :subscription, class_name: 'User', foreign_key: 'subscription_id'
end
