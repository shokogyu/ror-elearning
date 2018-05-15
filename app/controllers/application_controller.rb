class ApplicationController < ActionController::Base
  include SessionsHelper  # To be available anywhere

  private

  def admin_user
    unless current_user.admin?
      flash[:danger] = "You can't access to this page."
      redirect_to root_path
    end  
  end
  
end
