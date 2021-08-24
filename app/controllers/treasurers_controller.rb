class TreasurersController < ApplicationController
  before_action :set_treasurer, only:[:show, :edit, :update, :destroy]
  before_action :parent_and_child, only:[:show]
  def index
    @treasurers = current_user.treasurers.all
    @sum = current_user.treasurers.all.group(:category_id).sum(:use_money)

  end
  def new
    @treasurer = Treasurer.new
  end
  def create
    @treasurer = current_user.treasurers.build(treasurer_params)
    @kid = Management.find_by(kid_id: current_user.id)
    @treasurer.management_id = @kid.id
    # binding.pry
    if params[:back]
      render :new
    else
      if @treasurer.save
        redirect_to treasurers_path, notice: "出納情報を保存しました！"
      else
        render :new
      end
    end
  end
  def confirm
    @treasurer = current_user.treasurers.build(treasurer_params)
    unless Management.exists?(kid_id: current_user.id)
      redirect_to treasurers_path, notice: "親子関係の登録をしてないので保存できませんでした"
    else
      @kid = Management.find_by(kid_id: current_user.id)
      # binding.pry
      @treasurer.management_id = @kid.id
    render :new if @treasurer.invalid?
  end
end
  def show
    @favorite = current_user.favorites.find_by(treasurer_id: @treasurer.id)
    @comments = @treasurer.comments
    @comment = @treasurer.comments.build
    if @treasurer.user_id == current_user.id
      @sum = current_user.treasurers.all.group(:category_id).sum(:use_money)
    else
      @sum = User.find_by(id: @treasurer.user_id).treasurers.all.group(:category_id).sum(:use_money)
    end
  end
  def edit
  end
  def update
    if @treasurer.update(treasurer_params)
      redirect_to treasurers_path, notice: "出納情報を訂正しました！"
    else
      render :edit
    end
  end
  def destroy
    @treasurer.destroy
    redirect_to treasurers_path, notice:"出納情報を削除しました！"
  end

  private
  def treasurer_params
    params.require(:treasurer).permit(:use_date_at, :category_id, :use_what, :use_money, :get_money)
  end
  def set_treasurer
    @treasurer = Treasurer.find(params[:id])
  end
  def parent_and_child
    @treasurer.user_id == current_user.id || current_user.id == Management.find_by(parent_id: current_user.id).parent_id
  end
end


# 変える前のコード
# def confirm
#     @treasurer = current_user.treasurers.build(treasurer_params)
#     unless Management.exists?(kid_id: current_user.id)
#       redirect_to treasurers_path, notice: "親子関係の登録をしてないので保存できませんでした"
#     else
#       @kid = Management.find_by(kid_id: current_user.id)
#       binding.pry
#       @treasurer.management_id = @kid.id
#     render :new if @treasurer.invalid?
#   end
# end
