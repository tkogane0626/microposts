class ApplicationController < ActionController::Base

  # モジュールを呼ぶ
  include SessionsHelper

  private

  # ログイン認証
  def require_user_logged_in
    unless logged_in?
      redirect_to login_url
    end
  end
  
  # 各数をカウントする
  def counts(user)
    # micropost
    @count_microposts = user.microposts.count
    # フォロー
    @count_followings = user.followings.count
    # フォロワー
    @count_followers = user.followers.count
    # お気に入り
    @count_likes = user.likes.count
  end
  
end