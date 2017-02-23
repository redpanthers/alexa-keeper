class ContactsController < ApplicationController
 
 def create
    @contact = Contact.new(contact_params)
    if @contact.save
      flash[:note]="Your message successfully saved"
          redirect_to static_contact_path
      UserMailer.contact_email(@contact).deliver_now
    end
  end

  private
    def contact_params
      params.require(:contact).permit(:name, :email, :message)
    end
end
