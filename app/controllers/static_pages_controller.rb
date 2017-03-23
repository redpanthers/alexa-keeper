class StaticPagesController < ApplicationController
  def index
    if user_signed_in?
      if current_user.admin?
        @user = User.all
      end
      @website = Website.new
      @urls = current_user.websites
      @collection = Collection.new
      @collection_names = current_user.collections
      @collect = Collection.new
    end
  end

  def show
    website = current_user.websites
    if params[:collection_id].present?
      website = current_user.collections.find_by_id(params[:collection_id]).try(:websites)
    else
      website = current_user.websites
    end
    @alexa_rank_json = StaticPagesHelper.createJSON(website)
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
