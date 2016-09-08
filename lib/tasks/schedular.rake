desc "This task is called by Heroku schedular add-on 2,4 AM"
task :update_ranks => :environment  do
  TODAY = Time.zone.now.beginning_of_day
  Website.all.each do |website|
    if !website.alexaranks.where("created_at >= ?", TODAY).any?
      website.fetch_alexa_rank_and_update!
    end rescue Rails.logger.info "[ALF] Skipped #{website.url}"
  end
end
