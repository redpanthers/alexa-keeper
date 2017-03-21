class WebsitesController < ApplicationController
  def create
    if @web = Websites::Create.call(params, current_user)
      redirect_to root_url
    else
      redirect_to root_url
      flash[:not] = "The url added seems invalid. Please check again"
    end
  end

  def show
    website          = Website.find(params[:id])
    @alexa_rank_json = WebsitesHelper.createJSON(website)
    respond_to do |format|
      format.js
    end
  end

  def destroy
    Websites::Delete.call(params, current_user)
    redirect_to root_url
  end

  private

  def website_params
    params.require(:website).permit(:url, :user_id, :collection_id)
  end
end
