class ManagementsController < ApplicationController

  def new
    @management = Management.new
  end
  def create
    @management = Management.new(management_params)
    if User.find_by(email: @management.email).present?
      @kid = User.find_by(email: @management.email)
      @management.kid_id = @kid.id
      @management.parent_id = current_user.id
      # @management.valid?
      if @management.save
        redirect_to user_path(current_user.id), notice: "親子関係を設定しました"
      else
        render :new
      end
    else
      @management.parent_id = current_user.id
      @management.valid?
      @management.kid_id = current_user.id
      render :new, notice: "子供のメールアドレスを入力してください"
    end
  end
  def destroy
    @user = User.find(params[:id])
    redirect_to user_path(current_user.id) and return if current_user.parent_or_child == 1
    @management = Management.find_by(kid_id: @user.id)
    @management.destroy
    redirect_to users_path, notice:"親子関係を削除しました！"
  end
  private
  def management_params
    params.require(:management).permit(:email)
  end

end

# @management.parent_id = current_user.id
# unless @management.kid_id = User.find_by(email: @management.email).id
#    @management.valid?
# end
#   if @management.save
#     redirect_to user_path(current_user.id), notice: "managementテーブルのkid_idに子供のidを入れました"
#   else
#     render :new
#   end


# def create
#   @management = Management.new(management_params)
#   # if @management.valid?
#    @kid = User.find_by(email: @management.email)
#    @management.kid_id = @kid.id
#    @management.parent_id = current_user.id
#  # end
#      if @management.save
#        redirect_to user_path(current_user.id), notice: "managementテーブルのkid_idに子供のidを入れました"
#      else
#        render :new
#      end
# end
