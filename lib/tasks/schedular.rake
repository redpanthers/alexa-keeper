require 'nokogiri'
require 'open-uri'

def todaysRank(website)
  str  = 'http://www.alexa.com/siteinfo/'+website.url.to_s
  doc  = Nokogiri::HTML(open(str))
  rank = doc.css('strong.metrics-data.align-vmiddle')
            .inner_text
            .to_s
            .gsub(',', '')
            .split
            .first
  website.alexaranks.create!(rank:rank.to_i)
end

desc "This task is called by Heroku schedular add-on 6 AM and it will send mail"
task :send_mail => :environment  do
  failed_site  = []
  today        = Time.zone.now.beginning_of_day
  Website.all.each do |website|
    begin
      todaysRank(website) if(0 == website.alexaranks
                                         .where("created_at >= ?",today)
                                         .count)
    rescue
      failed_site << website.url.to_s
    end
  end
  #here we write & send mail with failed_site info
end

desc "This task is called by Heroku schedular add-on 2,4 AM"
task :re_update => :environment  do
  today        = Time.zone.now.beginning_of_day
  Website.all.each do |website|
    begin
      todaysRank(website) if(0 == website.alexaranks
                                         .where("created_at >= ?",today)
                                         .count)
    rescue

    end
  end
end

desc "This task is scheduled at midnight 12 for updating all rank"
task :update_rank => :environment  do
  today        = Time.zone.now.beginning_of_day
  Website.all.each do |website|
    begin
      todaysRank(website)
    rescue

    end
  end
end