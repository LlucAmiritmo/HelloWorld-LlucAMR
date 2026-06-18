class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?, :admin_user?, :normal_user?

  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    current_user.present?
  end

  def admin_user?
    current_user&.role&.admin == true
  end

  def normal_user?
    current_user&.role&.user == true
  end

  def require_login
    unless logged_in?
      redirect_to login_path, alert: "You must log in first."
    end
  end

  def require_admin
    return unless require_login == nil

    unless admin_user?
      redirect_to users_roles_path, alert: "You are not allowed to access the admin area."
    end
  end
end