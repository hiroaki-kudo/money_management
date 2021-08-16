class TreasurersController < ApplicationController
  before_action :set_treasurer, only:[:show, :edit, :update, :destroy]
  def index
    @treasurers = Treasurer.all
    # @category = Category.all
  end
  def new
    @treasurer = Treasurer.new
  end
  def create
    @treasurer = Treasurer.new(treasurer_params)
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
    @treasurer = Treasurer.new(treasurer_params)
    render :new if @treasurer.invalid?
  end
  def show
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
end
