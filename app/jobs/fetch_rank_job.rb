class FetchRankJob < ApplicationJob
  queue_as :default

  def perform(website)
    website.fetch_alexa_rank_and_update!
  end
end
