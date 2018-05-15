class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by(email: params[:session][:email])
  	if user && user.authenticate(params[:session][:password])
  		log_in user
  		params[:session][:remember_me] == '1' ? remember(user) : forget(user)
  		redirect_to root_path
  	else
  		flash[:danger] = "Email or password Invalid."
  		redirect_to 'new'
  	end
  end

  def destroy
  	log_out(current_user)
  	flash[:success] = "Logged out."
  	redirect_to root_path
  end

end
