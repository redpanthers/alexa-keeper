class RegistrationsController < Devise::RegistrationsController
  protected

  def sign_up_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def after_sign_up_path_for(resource)
    UserMailer.welcome_email(current_user.email).deliver_later
    after_sign_in_path_for(resource)
  end
end
