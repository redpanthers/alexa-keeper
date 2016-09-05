require 'nokogiri'
require 'open-uri'

desc "This task is called by Heroku schedular add-on"
task :update_rank => :environment  do
  puts "Updating feed..."
  Website.all.each do |website|
    str = 'http://www.alexa.com/siteinfo/'+website.url.to_s
    doc = Nokogiri::HTML(open(str))
    rank = doc.css('strong.metrics-data.align-vmiddle')
              .inner_text
              .to_s
              .gsub(',', '')
              .split
              .first
    website.alexaranks.create!(rank:rank.to_i)
  end
end