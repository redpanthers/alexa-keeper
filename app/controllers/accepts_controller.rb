class AcceptsController < ApplicationController
  def mail
    @invite = Invite.new(invite_params)
    @id = Invite.where(email: invite_params[:email]).select(:id)
    @user_email = @email
    hash = Digest::SHA512.hexdigest(@user_email.to_s)
    @str = (0...4).map { ('a'..'z').to_a[rand(26)] }.join
    if UserMailer.invite_email(@invite, @str, hash).deliver_now
      Invite.where(id: @id).update_all(accept: 'false')
      @accept = Statistic.pluck(:accepted_requests)
      @accept = @accept.map! { |s| s.to_i + 1 }
      Statistic.update_statistics(accepted_requests: @accept.last)
    end
    redirect_to admin_statistics_path
  end

  private

  def invite_params
    params.require(:invite).permit(:name, :email)
  end
end
