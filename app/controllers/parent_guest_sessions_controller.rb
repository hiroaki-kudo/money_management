class ParentGuestSessionsController < ApplicationController
  skip_before_action :login_required

  def create
    user = User.parent_guest
    log_in(user)
    redirect_to user_path(current_user.id)
    flash[:success] = 'ゲストユーザー(親)でログインしました'
  end
end
