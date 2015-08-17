class UsersController < ApplicationController
  

  def new
    @user = User.new 
  end

  def index
    @users = User.all
  end
  
  def create
    @user = User.new(user_params) 
    if @user.save
      if session[:user_id] = nil #why is this not working
        session[:user_id] = @user.id
        redirect_to root_path, notice: "Created user"
      else
        redirect_to root_path, notice: "Created user"
      end
    else
      render action: 'new', notice: "Failed to create user"
    end
  end
  
  private 

  def user_params
    params.require(:user).permit(:username, :email, :phone_number, :first_name, :last_name, :password, :password_confirmation) 
  end

end
