class FailingUpdationMailer < ApplicationMailer
  def send_remainder(arr)
    @arr = arr
    mail(to:'sameesh.fisat@gmail.com', subject: 'Testing Scraper')
  end
end
