class Notification < ApplicationRecord
  after_commit { NotificationRelayJob.perform_later self }

  belongs_to :user
end
