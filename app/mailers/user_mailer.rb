class UserMailer < ApplicationMailer
  default from: 'nimmy@redpanthers.co'
 
  def welcome_email(user)
    @user = user
    @url  = 'rankhub.co'
    mail(to: @user, subject: 'Welcome to RankHub')
  end
  
  def contact_email(conc)
    @cont = conc
    mail(to: "nimmy@redpanthers.co", subject: 'RankHub')
  end
  
  def feedback_email(fb)
    @feedback=fb
    mail(to: "nimmy@redpanthers.co", subject: 'RankHub')
    
  end

end
