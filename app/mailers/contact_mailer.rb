class ContactMailer < ActionMailer::Base
  default from: ENV["SITE_EMAIL"]
 
    default :bcc => ENV["ADMIN_EMAIL"]

    def site_message(message)
      @message = message
      @site_setup = SiteSetup.last
 
      mail(:subject => "Life Church #{message.subject}", :to => @site_setup.approval )
    end
end
