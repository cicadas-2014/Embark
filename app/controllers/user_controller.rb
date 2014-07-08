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
  	raise params.inspect
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
    params.require(:params).permit(:username, :email)
  end

  def login_password
    params.require(:params).permit(:password)
  end

  def signup_params
    params.permit(:email, :password)
  end

  def addAdventure
    if Adventure.makeAdventure(params[:title],params[:description],params[:start_city],params[:duration],params[:image_url],params[:categories])
      redirect_to users_path
    else
      redirect_to home_path
    end
  end

end
