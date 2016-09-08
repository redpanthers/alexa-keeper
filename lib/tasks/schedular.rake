require 'nokogiri'
require 'open-uri'

TODAY = Time.zone.now.beginning_of_day

desc "This task is called by Heroku schedular add-on 6 AM and it will send mail"
task :send_mail => :environment  do
  failed_site  = []
  today        = Time.zone.now.beginning_of_day
  Website.all.each do |website|
    begin
      Alexarank.fetch_rank(domain: website) if(0 == website.alexaranks
                                         .where("created_at >= ?",today)
                                         .count)
    rescue
      failed_site << website.url.to_s
    end
  end
  #here we write & send mail with failed_site info
end

desc "This task is called by Heroku schedular add-on 2,4 AM"
task :update_ranks => :environment  do
  Website.all.each do |website|
    if !website.alexaranks.where("created_at >= ?", TODAY).any?
      website.fetch_alexa_rank_and_update!
    end rescue Rails.logger.info "[ALF] Skipped #{website.url}"
  end
end
