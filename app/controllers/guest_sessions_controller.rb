class GuestSessionsController < ApplicationController
  skip_before_action :login_required

  def create
    user = User.guest
    log_in(user)
    redirect_to user_path(current_user.id)
    flash[:success] = 'ゲストユーザー(子)でログインしました'
  end

end
