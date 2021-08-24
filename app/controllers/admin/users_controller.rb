class Admin::UsersController < ApplicationController
  skip_before_action :login_required, only: [:index, :new, :create,]
  before_action :user_admin, only: [:index]
  def index
    @users = User.all.includes(:treasurers)
  end
  def new
    @user = User.new
  end
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to admin_user_path(@user.id)
    else
      render :new
    end
  end
  def show
    @user = User.find(params[:id])
    @treasurers = User.find(params[:id]).treasurers
  end
  def edit
    @user = User.find(params[:id])
  end
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to admin_users_path, notice: "ユーザ情報を編集しました！"
    else
      render :edit
    end
  end
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admin_users_path, notice:"ユーザ情報を削除しました！"
  end
  private
  def user_params
    params.require(:user).permit(:name, :email, :parent_or_child,
                                 :password, :password_confirmation)
  end
  def user_admin
    @users = User.all
    if current_user.admin == false
      flash[:aleat] = '管理者以外はアクセスできません'
      redirect_to user_path(current_user.id)
    else
      render action: "index"
    end
  end
  end
