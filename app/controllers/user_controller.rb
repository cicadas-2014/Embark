class UserController < ApplicationController

  def login
    @user = User.find_by(login_params).try(:authenticate, login_password[:password])
    if @user
      redirect_to root_path
    else
      redirect_to root_path 
    end
  end

  def signup
    @user = User.new(signup_params)
    if @user.save
      
    else
      redirect_to root_path 
    end
  end

  def logout
  	session.clear
  end

  private

  def login_params
    params.permit(:username, :email)
  end

  def login_password
    params.permit(:password)
  end

  def signup_params
    params.permit(:username, :email, :password, :password_confirmation)
  end

end
end
