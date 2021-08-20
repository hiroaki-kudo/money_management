class ManagementsController < ApplicationController
  def new
    @management = Management.new
  end
  def create
    @management = Management.new(management_params)
    # @management.kid_id = User.find_by(email: params[kid_id])
    @management.parent_id = current_user.id
      if @management.save
        redirect_to treasurers_path, notice: "managementテーブルのkid_idに子供のidを入れました"
      else
        render :new
      end
  end
  private
  def management_params
    params.require(:management).permit(:pocket_money, :kid_id)
  end
end
