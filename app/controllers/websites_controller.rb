class WebsitesController < ApplicationController
  def create
    Websites::Create.call(params, current_user)
    redirect_to root_url
  end

  def show
    website          = Website.find(params[:id])
    @alexa_rank_json = WebsitesHelper.createJSON(website)
    Website::ToJSON.call(website)
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

  def website_create_params
    website_params.select{|x| Website.attribute_names.index(x)}
  end
end
