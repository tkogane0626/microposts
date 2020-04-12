class LikesController < ApplicationController
  
  def create
    micropost = Micropost.find(params[:micropost_id])
    current_user.like_post(micropost)
    flash[:success] = 'お気に入りに追加しました。'
    redirect_back(fallback_location: root_url)
  end

  def destroy
    micropost = Micropost.find(params[:micropost_id])
    current_user.unlike_post(micropost)
    flash[:danger] = 'お気に入りを解除しました。'
    redirect_back(fallback_location: root_url)
  end
  
end
