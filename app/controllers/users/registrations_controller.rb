module Users
  class RegistrationsController < Devise::RegistrationsController
    def new
      if invite_missing?
        redirect_to root_path
      else
        super
      end
    end

    def create
      super
      Invite.find_by(token: session[:token]).update(accepted: true) if resource.persisted?
    end

    private

    def invite_missing?
      session[:token].nil? ||
        Invite.find_by(token: session[:token], accepted: false).blank?
    end
  end
end
