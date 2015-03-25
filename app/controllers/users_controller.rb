class UsersController < ApplicationController

  def index

  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "Profile updated."
      redirect_to user_path(@user)
    else
      flash[:error] = "Profile not updated!"
      redirect_to :edit
    end
  end

private
  def user_params
    params.require(:user).permit(:name, :bio)
  end

end
