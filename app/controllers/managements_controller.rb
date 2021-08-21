class ManagementsController < ApplicationController
  def new
    @management = Management.new
  end
  def create
    @management = Management.new(management_params)
    # if @management.valid?
     @kid = User.find_by(email: @management.email)
     @management.kid_id = @kid.id
     @management.parent_id = current_user.id
   # end
       if @management.save
         redirect_to user_path(current_user.id), notice: "managementテーブルのkid_idに子供のidを入れました"
       else
         render :new
       end
  end
  private
  def management_params
    params.require(:management).permit(:pocket_money, :email)
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
