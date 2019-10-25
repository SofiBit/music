class NotificationsController < ApplicationController
  include Notifications

  def index
    @notifications = current_user.notifications.sort_by_date
    checked_notifications(current_user)
    respond_to { |format| format.js }
  end
end
