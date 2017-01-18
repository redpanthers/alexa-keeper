class AcceptsController < ApplicationController

  def create
  
  end
  
  def mail
    @invite = Invite.new(invite_params)
    @user_email = @email
    hash = Digest::SHA512.hexdigest("#{@user_email}")
      @str=(0...4).map { ('a'..'z').to_a[rand(26)] }.join

      UserMailer.invite_email(@invite,@str,hash).deliver_now
    redirect_to root_url
  end
    private
  def invite_params
    params.require(:invite).permit(:name, :email)
  end

end







