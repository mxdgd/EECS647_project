class Admin::AboutsController < ApplicationController
  layout "admin"
  before_action :load_about, only: [:show, :edit, :update]
  
  def show

  end

  def edit

  end

  def update
    if @about.update(about_params)
      redirect_to admin_about_path
    else
      render :edit
    end
  end

  private

  def load_about
    @about = About.where(user_id: current_user.id).first_or_create
  end

  def about_params
    params
      .require(:about)
      .permit(
        :photo,
        :bio,
        :resume
      )
  end
end
