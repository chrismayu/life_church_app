class MemberMailer < ActionMailer::Base
  default from: ENV["SITE_EMAIL"]

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.member_mailer.your_approved.subject
  #
  def your_approved(member)
    @member = member
    mail(to: member.email, :subject => "Welcome to LifeChurch")
  end
  
  def welcome_email(member)
    @member = member
    mail(to: member.email, :subject => "Welcome to LifeChurch WebSite")
  end
  
end
