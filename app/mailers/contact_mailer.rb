class ContactMailer < ActionMailer::Base
  default from: ENV["SITE_EMAIL"]
 
    default :to => ENV["ADMIN_EMAIL"]

    def site_message(message)
      @message = message
      mail(:subject => "[YourWebsite.tld] #{message.subject}")
    end
end
