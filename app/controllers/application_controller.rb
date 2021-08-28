class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  before_action :login_required
  private
  def login_required
    redirect_to root_path, notice: "ログインしてない人はアクセスできません。"  unless current_user
  end
  def log_in(user)
      session[:user_id] = user.id
  end

  def parent_or_child?
    (@treasurer.management.parent_id == current_user.id && @treasurer.management.kid_id != current_user.id) || (@treasurer.management.parent_id != current_user.id && @treasurer.management.kid_id == current_user.id)
  end
  def child_or_parent?
    @user.id == current_user.id || Management.find_by(parent_id: current_user.id).present?

    # (@user.id == current_user.id || Management.find_by(parent_id: current_user.id).present?) || current_user.admin == false

    # || (@user.management.parent_id != current_user.id && @user.management.kid_id == current_user.id)
  end
end
