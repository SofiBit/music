class Notification < ApplicationRecord
  after_create_commit { NotificationRelayJob.perform_later(self, user) }

  belongs_to :user
  belongs_to :sender, class_name: 'User', foreign_key: 'sender_id'

  scope :new_notifications, -> { where(checked: false) }
  scope :sort_by_date, -> { order(:created_at).reverse_order }
end
