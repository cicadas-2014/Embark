class UsersController < ApplicationController

  def index 
    @user = User.find(session[:id])

  end

  def login
    @user = User.find_by(login_params).try(:authenticate, login_password[:password])
    if @user
      session[:id] = @user.id
      redirect_to root_path
    else
      redirect_to root_path 
    end
  end

  def create
    @user = User.new(signup_params)
    if @user.save
      p "success"+ "*"*10000
      session[:id] = @user.id
      redirect_to root_path
    else
      redirect_to root_path 
    end
  end

  def logout
  	session.clear
    redirect_to root_path
  end

  private

  def login_params
    params.require(:params).permit(:email)
  end

  def login_password
    params.require(:params).permit(:password)
  end

  def signup_params
    params.permit(:email, :password)
  end

end
