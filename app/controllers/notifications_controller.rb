class NotificationsController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @notifications = @user.notifications
  end

  def show
    @notification = Notification.find(params[:id])
    @notification.read = true
    @notification.save
    render 'index'
  end

  def new
    @user = User.find(params[:user_id])
    @notification = Notification.new
  end

  def create
    @user = User.find(params[:user_id])
    @listing =
    notification = @user.notifications.new(notification_params)
    notification.requester = current_user
    notification.read = false
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
    params.require(:notification).permit(:title, :body, :listing_id)
  end

end
