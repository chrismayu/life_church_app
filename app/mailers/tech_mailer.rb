class TechMailer < ActionMailer::Base
  default from: ENV["SITE_EMAIL"]
 
    default :to => ENV["ADMIN_EMAIL"]

    def tech_support(message)
      @message = message
      mail(:subject => "Life Church Tech - #{message.subject}")
    end
end
