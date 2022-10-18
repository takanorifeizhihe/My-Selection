class Public::UsersController < ApplicationController
  def edit
    @user = current_user
  end

  def update
    @user = current_user
    #byebug
    @user.update!(user_params)
    redirect_to users_my_page_path
  end

  def show
    @user = current_user
    @movies = current_user.favorite.movies
    @other_contents = current_user.like.other_contents
  end

  def unsubscribe
    @user = current_user
  end

  def withdraw
    @user = current_user
    @user.update(is_active: false)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :nickname, :birthday, :is_active)
  end

end
