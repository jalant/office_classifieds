class NotificationsController < ApplicationController
  def update
    notification = Notification.find_by_id(params[:id])
    notification.read = true
    notification.save
    respond_to do |
      format.js
    end
  end
end
