# frozen_string_literal

module NotificationsHelper
  def new_notifications_count(user)
    user.notifications.new_notifications.count
  end

  def has_new_notice?(user)
    new_notifications_count(user) > 0
  end
end
