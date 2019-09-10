class NotificationRelayJob < ApplicationJob
  queue_as :default

  def perform(notification)
    ApplicationController.renderer.render(partial: 'notifications/notification', locals: {notification: notification})
  end
end
