class UsersController < ApplicationController
  before_action :set_users, only: [:show]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user.id)
    else
      render :new
    end
  end

  def show
    @favorite_count = Favorite.joins(:blog).where(blogs: {user_id: current_user.id}).length
    @favorites = current_user.favorites
  end

  private
  def set_users
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end
end
