class ContactsController < ApplicationController
 
 def create
    @contact = Contact.new(contact_params)
    if @contact.save
          flash[:notice] = "Your details are successfully saved"

      UserMailer.contact_email(@contact).deliver_now
          redirect_to root_url
    end
  end

  private

    def contact_params
      params.require(:contact).permit(:name, :email, :message)
    end
end
