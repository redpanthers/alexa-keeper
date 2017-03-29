class InvitesController < ApplicationController
  def index
    token = params[:token]
    session[:token] = token
    redirect_to new_user_registration_path
  end

  def create
    invite = Invite.new(invite_params)
    invite.save!

    flash[:notice] = 'Thank You for requesting an invitation to use RankHub. We will shortly send you an invitation code to register at RankHub'
    redirect_to static_invite_path
  end

  def approve
    invite = Invite.find(params[:id])
    invite.update(approved: true)
    redirect_to admin_analytics_path
  end

  private

  def invite_params
    params.require(:invite).permit(:name, :email)
  end
end
