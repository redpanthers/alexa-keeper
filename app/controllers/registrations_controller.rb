class RegistrationsController < Devise::RegistrationsController
  protected
  def after_sign_up_path_for(resource)
    @user = current_user.email
    UserMailer.welcome_email(@user).deliver_now
      after_sign_in_path_for(resource)
  end
end
