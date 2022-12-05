class Admin::UsersController < ApplicationController

before_action :authenticate_admin!
  
  def index
    @users = User.page(params[:page])
  end

  def create
    
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to admin_user_path(@user.id)
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def show
    @user = User.find(params[:id])
  end
  def user_params
    params.require(:user).permit(:email, :nickname, :birthday, :is_active)
  end
end
