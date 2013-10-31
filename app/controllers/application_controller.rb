class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_in) << :name
    devise_parameter_sanitizer.for(:sign_up) << :name
    devise_parameter_sanitizer.for(:account_update) << :name
  end

  def require_login(msg)
    unless user_signed_in?
      flash[:info] = msg
      redirect_to(new_user_session_url)
    end
  end

  def require_admin
    unless current_user.admin
      flash[:info] = "Sorry, only admins have access to that page"
      redirect_to(root_url)
    end
  end
end
