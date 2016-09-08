require 'nokogiri'
require 'open-uri'

desc "Email sending with rake"
task :send_remainder => :environment do
  sites = []
  sites << 'google.com'
  sites << 'facebook.com'
  FailingUpdationMailer.send_remainder(sites).deliver
end
