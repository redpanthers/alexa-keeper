class TokensController < ApplicationController
 
  def create
    @token = Token.new(token_params)
    if Token.exists?(:token => @token.token)
      redirect_to static_pages_token_path
      flash[:msg] = "The invite code you are trying to use has expired. Kindly send a mail to admin@rankhub.co for a new invite code"
    elsif @token.token==session[:token]
      @token.save
      redirect_to new_user_registration_path
    else 
      redirect_to static_token_path
      flash[:message] = "Kindly enter the invite code you have received"

    end
  end

  private

    def token_params
      params.require(:token).permit(:token)
    end
end