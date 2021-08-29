class Admin::UsersController < ApplicationController
  skip_before_action :login_required, only: [:index, :new, :create,]
  before_action :user_admin, only: [:index]
  before_action :admin_not_destroy, only: [:destroy]
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
    # binding.pry
    if @user.parent_or_child == 1 && Management.where(email: @user.email).empty?
      @user.destroy
      redirect_to admin_users_path, notice:"ユーザ情報を削除しました！"
    elsif @user.parent_or_child == 1
      # binding.pry
      @management = Management.find_by(kid_id: @user.id)
      @management.destroy
      @user.destroy
      redirect_to admin_users_path, notice:"ユーザ情報を削除しました！"
    else
      @user.destroy
      redirect_to admin_users_path, notice:"ユーザ情報を削除しました！"
    end

    # if @user.parent_or_child == 1
    #   binding.pry
    #   @management = Management.find_by(kid_id: @user.id)
    #   @management.destroy
    #   @user.destroy
    #   redirect_to admin_users_path, notice:"ユーザ情報を削除しました！"
    # elsif @user.parent_or_child == 1 && @user.id != Management.find_by(kid_id: @user.id).include?
    #   @user.destroy
    #   redirect_to admin_users_path, notice:"ユーザ情報を削除しました！"
    # else
    #   @user.destroy
    #   redirect_to admin_users_path, notice:"ユーザ情報を削除しました！"
    # end


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
  def admin_not_destroy
    if (current_user.admin == true) && (User.find(params[:id]).id == current_user.id)
      redirect_to admin_users_path, notice:"管理者自身を消すことはできません。"
    end
  end
end
