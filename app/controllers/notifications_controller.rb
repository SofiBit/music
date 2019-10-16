class NotificationsController < ApplicationController
  def index
    @notifications = current_user.notifications.all.reverse
    respond_to { |format| format.js }
  end
end
