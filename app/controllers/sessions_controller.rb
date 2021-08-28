class SessionsController < ApplicationController
  skip_before_action :login_required, only: [:new, :create]
  def new
  end
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      if user.parent_or_child == 0
        redirect_to user_path(user.id)
      else
        redirect_to treasurers_path
      end
    else
      flash.now[:danger] = 'ログインに失敗しました'
      render :new
    end
  end
  def destroy
    session.delete(:user_id)
    flash[:notice] = 'ログアウトしました'
    redirect_to root_path
  end
end
