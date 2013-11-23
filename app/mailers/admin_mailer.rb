class AdminMailer < ActionMailer::Base
  default from: ENV["SITE_EMAIL"]
 
    default :to => ENV["ADMIN_EMAIL"]
 
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.admin_mailer.new_member_signed_up.subject
  #
  def new_user_waiting_for_approval(member)
    mail(:subject => "#{member.name} - Approval Needed")
  end
end
