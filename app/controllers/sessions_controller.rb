class SessionsController < ApplicationController
  def new
    if current_user.nil?
    else
      @user = current_user
      redirect_to users_path
    end
  end
  
  def create
  	@user = User.find_by(username: params[:username]).try(:authenticate, params[:password]) 
  	if @user
  		session[:user_id] = @user.id 
  		redirect_to root_path, notice: "You are now logged in as #{@user.username}!"
  	else
		  redirect_to '/login'
  	end
  end

  def destroy
   session[:user_id] = nil
   redirect_to(root_path, notice: 'Logged out!')
  end



end
