class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  before_action :login_required
  private
  def login_required
    redirect_to root_path unless current_user
  end
  def log_in(user)
      session[:user_id] = user.id
  end
end
