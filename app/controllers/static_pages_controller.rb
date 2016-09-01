class StaticPagesController < ApplicationController
  def index
    if user_signed_in?
      #current_user.update_attribute :admin, true
      if current_user.admin?
        @user = User.all
      end
      @website = Website.new
      @urls = current_user.websites.all
    end
  end

  def show
  end

  def destroy
    User.destroy(params[:format])
    Website.destroy_all(user_id: params[:format])
    redirect_to root_url
  end
end
