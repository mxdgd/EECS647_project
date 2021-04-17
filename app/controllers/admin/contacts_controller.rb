class Admin::ContactsController < ApplicationController
  layout "admin"
  before_action :authenticate_user!
  before_action :load_contact, only: [:show, :edit, :update]
 
  def show

  end

  def edit

  end

  def update
    if @contact.update(contact_params)
      redirect_to admin_contact_path
    else
      render :edit
    end
  end

  private

  def load_contact
    @contact = @current_user.contact
  end

  def contact_params
    params
      .require(:contact)
      .permit(
        :email,
        :facebook,
        :instagram,
        :twitter,
        :vimeo,
        :youtube
      )
  end
end