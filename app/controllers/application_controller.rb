class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  #before_action :isadmin
  before_action :current_user
  before_action :signed_in?

  def authenticate_admin_user!
    redirect_to root_path if !signed_in?
    redirect_to pins_path if !current_user.admin?
  end

  helper_method :current_user, :signed_in?

  def current_user
    @current_user ||= User.where(:id => session[:current_user_id]).first
  end

  def signed_in?
    if current_user.present?
      return true
    else redirect_to root_path
    end
  end

  private

  def isadmin
    if current_user.admin != 'true'
      redirect_to pins_path
      flash[:notice] = "Access Denied!"
    end
  end
end
