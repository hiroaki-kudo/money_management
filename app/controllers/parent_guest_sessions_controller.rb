class ParentGuestSessionsController < ApplicationController
  skip_before_action :login_required

  def create
    user = User.find_by(email: 'haha@haha.com')
    log_in(user)
    flash[:success] = 'ゲストユーザー(親)でログインしました'
    redirect_to user_path(user.id)
  end
end
