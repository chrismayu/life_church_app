class AdminMailer < ActionMailer::Base
  default from: ENV["SITE_EMAIL"]
 
   default :bcc => ENV["ADMIN_EMAIL"]
 
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.admin_mailer.new_member_signed_up.subject
  #
  def new_user_waiting_for_approval(member)
    @member = member
   @site_setup = SiteSetup.last
    
    mail(:subject => "#{member.name} - Approval Needed", :to => @site_setup.approval )
  end
  
  
  def let_us_know(member)
    @member = member
    @site_setup = SiteSetup.last
    mail(:subject => "#{member.name} - Would like to be a volunteer", :to => @site_setup.approval )
  end
  
  
  
end
