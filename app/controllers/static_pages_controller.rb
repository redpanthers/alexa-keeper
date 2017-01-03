class StaticPagesController < ApplicationController
  def index
    if user_signed_in?
      if current_user.admin?
        @user = User.all
      end
      @website = Website.new
      @urls = current_user.websites
    end
  end

  def contact
  end

  def terms
  end

  def privacy
  end
    
  

  def show
    web = Website.where(user_id: current_user.id)
    @alexa_rank_json = StaticPagesHelper.createJSON(web)
    respond_to do |format|
      format.html
      format.json { render json: @alexa_rank_json}
    end
  end

  def destroy
    id = params[:format]
    User.destroy(id)
    Website.where(user_id: id).destroy_all
    redirect_to root_url
  end
end
