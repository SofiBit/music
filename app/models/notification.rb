class Notification < ApplicationRecord
  after_commit { NotificationRelayJob.perform_later self }

  belongs_to :user
  belongs_to :sender, class_name: 'User', foreign_key: 'sender_id'
end
