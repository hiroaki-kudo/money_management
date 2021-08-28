class UsersController < ApplicationController
  before_action :set_user, only:[:show, :edit, :update, :destroy]
  skip_before_action :login_required, only: [:new, :create]
  before_action :child_and_parent, only: [:show, :edit]
  def index
    @users = Management.where(parent_id: current_user.id)
  end
  def new
    @user = User.new
  end
  def create
    @user = User.new(user_params)
    if @user.save
      if @user.parent_or_child == 0
        session[:user_id] = @user.id
        redirect_to user_path(@user.id), notice: "アカウントを作成しました"
      else
        redirect_to root_path, notice: "アカウントを作成しました"
      end
    else
      render :new
    end
  end
  def show
    @treasurers = User.find(params[:id]).treasurers
    # binding.pry
  end
  def edit
    redirect_to user_path(current_user.id) and return if current_user.parent_or_child == 1
  end
  def update
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice: "ユーザ情報を訂正しました！"
    else
      render :edit
    end
  end
  def destroy
    # redirect_to user_path(@user.id) and return if @user.parent_or_child == 1
    # @management = Management.where(kid_id: @user.id, parent_id: current_user.id)
    # @management.first.destroy
    #
    # @user.destroy
    # redirect_to users_path, notice:"ユーザ情報を削除しました！"
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :parent_or_child,
                                 :password, :password_confirmation )
  end
  def set_user
    @user = User.find(params[:id])
  end
  def child_and_parent
    unless child_or_parent?
      redirect_to user_path(current_user.id), notice: "別の子供のページは見れません"
    end
  end
end
