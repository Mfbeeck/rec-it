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
        session[:user_id] = @user.id
        redirect_to user_path(@user), notice: "Created user"
    else
      render action: 'new', notice: "Failed to create user"
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    if @user.save
      redirect_to user_path(@user), notice: "#{@user.username.capitalize}'s info was successfully updated."
    else
      render action: "edit"
    end
  end

  def show
    @user = User.find(params[:id])
  end

  
  private 

  def user_params
    params.require(:user).permit(:username, :email, :phone_number, :first_name, :last_name, :password, :password_confirmation) 
  end

end
