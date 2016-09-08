
class WebsiteAddJob
  include SuckerPunch::Job
  workers 4

  def perform(website)
    website.fetch_alexa_rank_and_update!
  end
end
