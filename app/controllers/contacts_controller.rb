class ContactsController < ApplicationController
  def create
    @contact = Contact.new(contact_params)
    UserMailer.contact_email(@contact).deliver_later if @contact.save
    redirect_to root_path
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :message)
  end
