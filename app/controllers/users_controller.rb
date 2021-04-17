class UsersController < ApplicationController
  def index
    
  end

  def login
    @user = User.find_by_email(params[:email])
    unless @user.nil?
      if @user.password == params[:password]
        session[:user_id] = @user.id
        redirect_to admin_root_path
      else
        redirect_to users_path
      end
    else
      redirect_to users_path
    end
  end
end
