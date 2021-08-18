class GuestSessionsController < ApplicationController
  skip_before_action :login_required

  def create
    user = User.find_by(email: 'guest@guest.com')
    log_in(user)
    flash[:success] = 'ゲストユーザーでログインしました'
    redirect_to user_path(user.id)
  end

end
