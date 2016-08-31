class StaticPagesController < ApplicationController
  def index
    @website = Website.new if user_signed_in?
  end

  def show
  end
end
