class AcceptsController < ApplicationController
  def mail
    @invite = Invite.new(invite_params)
    @ids = Invite.where(email: invite_params[:email]).pluck(:id)
    @user_email = @email
    hash = Digest::SHA512.hexdigest(@user_email.to_s)
    @str = (0...4).map { ('a'..'z').to_a[rand(26)] }.join
    Invite.where(id: @ids).update(token: @str)
    if UserMailer.invite_email(@invite, @str, hash).deliver_now
      Invite.where(id: @ids).update_all(approved: 'false')
    end
    redirect_to admin_analytics_path
  end

  private

  def invite_params
    params.require(:invite).permit(:name, :email)
  end
end
