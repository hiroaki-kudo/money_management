class GuestSessionsController < ApplicationController
  skip_before_action :login_required

  def create
    user = User.guest
    log_in(user)
    redirect_to treasurers_path
    flash[:success] = 'ゲストユーザー(子)でログインしました'
  end

end
