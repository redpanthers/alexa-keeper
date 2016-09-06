class WebsitesController < ApplicationController

  def create
    @website = current_user.websites.build(website_params)
    WebsiteAddJob.perform_async(@website) if @website.save
    redirect_to root_url
  end

  def show
    website              = Website.find(params[:id])
    ranks                = website.alexaranks.all
    @alexa_rank_json     = WebsitesHelper.createJSON(ranks, website.url)
    puts @alexa_rank_json
    #@chart_settings_json = WebsitesHelper.getSettings();
    website          = Website.find(params[:id])
    ranks             = website.alexaranks
    @alexa_rank_json = WebsitesHelper.createJSON(ranks, website.url)
    respond_to do |format|
      format.js
    end
  end

  def destroy
    id = params[:id]
    Website.destroy(id)
    Alexarank.where(website_id: id).destroy_all
    redirect_to root_url
  end

  private
    def website_params
      params.require(:website).permit(:url, :user_id)
    end
end
