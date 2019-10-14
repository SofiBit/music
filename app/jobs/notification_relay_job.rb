class NotificationRelayJob < ApplicationJob
  queue_as :default

  def perform(notification, target_user)
    ActionCable.server.broadcast("notifications_channel:#{target_user.id}", message: render_notification(notification))
  end

  private

  def render_notification(notification)
    ApplicationController.renderer.render(partial: 'notifications/notification', locals: { notification: notification })
  end
end
