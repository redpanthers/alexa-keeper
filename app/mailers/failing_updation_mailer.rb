class FailingUpdationMailer < ApplicationMailer
  # TODO: Remove this if it is no longer in use
  def send_remainder(arr)
    @arr = arr
    mail(to: 'rankhub@redpanthers.co', subject: 'Testing Scraper')
  end
end
