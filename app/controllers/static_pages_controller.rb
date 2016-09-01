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
    id = params[:format]
    User.destroy(id)
    Website.where(user_id: id).destroy_all
    redirect_to root_url
  end
end
