class ApplicationController < ActionController::Base
  def authenticate_user!
    if session[:user_id].nil?
      redirect_to users_path
    else
      @current_user = User.find(session[:user_id])
    end
  end
end
