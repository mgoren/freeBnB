class UsersController < ApplicationController
before_filter :authenticate_user!, except: [:index, :show]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    unless @user == current_user
      flash[:error] = "You cannot edit another user's profile!"
      redirect_to user_path(@user)
    else
      if @user.update(user_params)
        flash[:notice] = "Profile updated."
        redirect_to user_path(@user)
      else
        flash[:error] = "Profile not updated!"
        redirect_to edit_user_path(@user)
      end
    end
  end

private
  def user_params
    params.require(:user).permit(:name, :bio)
  end

end
