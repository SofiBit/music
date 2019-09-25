class NotificationsController < ApplicationController
  def index
    @notifications = current_user.notifications.all.reverse
    current_user.notifications.each do |notice|
      notice.status = 'checked'
      notice.save
    end
  end
end
