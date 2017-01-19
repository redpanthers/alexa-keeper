class InvitesController < ApplicationController

 def index
  token=params[:token]
  session[:token] = token
  hash=params[:hash]
  session[:hash]=hash
 
  redirect_to static_pages_token_path
 end



  def create
    @invite = Invite.new(invite_params)   
    if @invite.save  
    
      flash[:note]="Thank You for requesting an invitation to use RankHub. We would shortly send you an invitation code to register at RankHub"

    
      redirect_to static_pages_invite_path

      
    end
  end
  def mail
    @user = Invite.new(invite_params)
    @user_email = @email
    hash = Digest::SHA512.hexdigest("#{@user_email}")

    @str=(0...4).map { ('a'..'z').to_a[rand(26)] }.join
    UserMailer.invite_email(@invite,@str,hash).deliver_now

  end
    private
  def invite_params
    params.require(:invite).permit(:name, :email)
  end
end
