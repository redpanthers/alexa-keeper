class StaticPagesController < ApplicationController
  def index
    if user_signed_in?
      @website = Website.new
      @urls = current_user.websites.all
    end
  end

  def show
  end
end
