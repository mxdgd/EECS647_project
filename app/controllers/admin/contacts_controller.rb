class Admin::ContactsController < ApplicationController
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
    @contact = Contact.where(user_id: current_user.id).first_or_create(user_id: current_user.id, email: current_user.email)
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
