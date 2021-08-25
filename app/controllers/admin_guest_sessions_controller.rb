class AdminGuestSessionsController < ApplicationController
  skip_before_action :login_required

  def create
    user = User.admin_guest
    log_in(user)
    redirect_to user_path(current_user.id)
    flash[:success] = '管理者ゲストユーザーでログインしました'
  end
end
