require 'nokogiri'
require 'open-uri'

class WebsiteAddJob
  include SuckerPunch::Job
  workers 4

  def perform(website)
    str = 'http://www.alexa.com/siteinfo/'+website.url.to_s
    doc = Nokogiri::HTML(open(str))
    rank = doc.css('strong.metrics-data.align-vmiddle').inner_text.to_s.gsub(',', '').split.first
    website.alexaranks.create!(rank:rank.to_i)
  end
end
