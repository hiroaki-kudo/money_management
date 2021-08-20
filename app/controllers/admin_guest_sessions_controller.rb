class AdminGuestSessionsController < ApplicationController
  skip_before_action :login_required

  def create
    user = User.find_by(email: 'kanri@kanri.com')
    log_in(user)
    flash[:success] = '管理者ゲストユーザーでログインしました'
    redirect_to user_path(user.id)
  end
end
