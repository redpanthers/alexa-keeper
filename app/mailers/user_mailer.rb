class UserMailer < ApplicationMailer
  default from: 'nimmy@redpanthers.co'
 
  def welcome_email(user)
    @user = user
    @url  = 'rankhub.co'
    mail(to: @user, subject: 'Welcome to RankHub')
  end

  def invite_email(invite,str,hash)
    @invite = invite
    @str = str
    @hash = hash
    @url  = 'http://localhost:3000/'+@hash
    mail(to: @invite.email, subject: 'Welcome to RankHub')
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
