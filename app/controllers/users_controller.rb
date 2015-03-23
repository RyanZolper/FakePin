class UsersController < ApplicationController

  skip_before_action :current_user, except: [:logout]
  skip_before_action :signed_in?

  def new
  end
  def index
  end
  def loginpage
    @user = User.new
  end
  def login
    @user = User.find_by(email: params[:user][:email])
    if @user && @user.authenticate(params[:user][:password])
      redirect_to pins_path, alert: "Login Success!"
      cookies[:current_user_id] = @user.id
    else redirect_to 'users/loginpage', alert: "Try Again"
    end
  end
  def logout
    cookies.delete :current_user_id
    redirect_to users_loginpage_path
  end
  def create
    @user = User.new(user_params)
    if @user.save
      UserMailer.welcome_email(@user).deliver_later
      cookies[:current_user_id] = @user.id
      redirect_to pins_path
    else
      redirect_to 'users/home', alert: "Try again"

    end

  end
  def home
    @user = User.new
  end

  def user_params
    params.require(:user).permit(:name, :password_digest, :email, :admin, :password, :password_confirmation)
  end

end
