class ManagementsController < ApplicationController
  def new
    @management = Management.new
  end
  def create
    @management = Management.new(management_params)
    @kid = User.find_by(email: @management.email)
    @management.kid_id = @kid.id
    @management.parent_id = current_user.id
    binding.irb
      if @management.save
        redirect_to treasurers_path, notice: "managementテーブルのkid_idに子供のidを入れました"
      else
        render :new
      end
  end
  private
  def management_params
    params.require(:management).permit(:pocket_money, :email)
  end
end
