class ToppagesController < ApplicationController
  
  # micropostの一覧を表示
  def index
    if logged_in?
      @micropost = current_user.microposts.build
      @microposts = current_user.feed_microposts.order(id: :desc).page(params[:page])
    end
  end
  
end
