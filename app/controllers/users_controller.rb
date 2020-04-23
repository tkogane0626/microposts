class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :show]
  
  # ユーザ一覧
  def index
    @users = User.order(id: :desc).page(params[:page]).per(25)
  end

  # ユーザ情報詳細
  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.order(id: :desc).page(params[:page])
    counts(@user)
  end

  # ユーザ登録フォーム
  def new
    @user = User.new
  end

  # ユーザ登録
  def create
    @user = User.new(user_params)

    if @user.save
      # ユーザ登録が完了
      flash[:success] = 'ユーザを登録しました。'
      redirect_to @user
    else
      # ユーザ登録が失敗
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end
  end
  
  # フォローの表示/カウント
  def followings
    @user = User.find(params[:id])
    @followings = @user.followings.page(params[:page])
    counts(@user)
  end
  
  # フォロワーの表示/カウント
  def followers
    @user = User.find(params[:id])
    @followers = @user.followers.page(params[:page])
    counts(@user)
  end
  
  # お気に入りの表示/カウント
  def likes
    @user = User.find(params[:id])
    @likes = @user.liking.page(params[:page])
    counts(@user)
  end
  
  private
  
  # Strong Pamameter
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
end
