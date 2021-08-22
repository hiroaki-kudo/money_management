class UsersController < ApplicationController
  before_action :set_user, only:[:show, :edit, :update, :destroy]
  skip_before_action :login_required, only: [:new, :create]
  def index
    @users = Management.where(parent_id: current_user.id)
  end
  def new
    @user = User.new
  end
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user.id)
    else
      render :new
    end
  end
  def show
    @treasurers = User.find(params[:id]).treasurers
  end
  def showkid
    # @users.each do |f|
    #   @a = User.find_by(id: f.id)
    # @users = User.all.includes(:treasurers)
    # @user = User.find(params[:id])
    # binding.pry
    # @treasurers = User.find(params[:id]).treasurers
  end
  def edit
  end
  def update
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice: "ユーザ情報を訂正しました！"
    else
      render :edit
    end
  end
  def destroy
    @user.destroy
    redirect_to new_user_path, notice:"ユーザ情報を削除しました！"
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :parent_or_child,
                                 :password, :password_confirmation )
  end
  def set_user
    @user = User.find(params[:id])
  end
end
