class Public::HomesController < ApplicationController

  def guest_sign_in
    user = User.find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      # user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
      # 例えば name を入力必須としているならば， user.name = "ゲスト" なども必要
    end
    sign_in user
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end

  def top
    @other_contents = OtherContent.all.page(params[:page]).per(10)
    @posts = Post.all
    @sum = 0
  end

  def about
  end

end
