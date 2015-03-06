class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  #before_action :isadmin

  def current_user
    @current_user ||= User.last
  end

  private

  def isadmin
    if current_user.admin != 'true'
      redirect_to root_path
      flash[:notice] = "Access Denied!"
    end
  end
end
