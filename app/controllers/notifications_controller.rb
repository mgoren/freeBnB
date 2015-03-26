class NotificationsController < ApplicationController

  def new
    @user = User.find(params[:user_id])
    @notification = Notification.new
  end

  def create
    @user = User.find(params[:user_id])
    notification = @user.notifications.new(notification_params)
    notification.requester = current_user
    if notification.save
      flash[:notice] = "Your request was sent!"
      redirect_to user_path(@user)
    else
      flash[:error] = "Request not sent!"
      redirect_to :new
    end
  end

private
  def notification_params
    params.require(:notification).permit(:title, :body)
  end

end
