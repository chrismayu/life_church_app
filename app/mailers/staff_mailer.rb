class StaffMailer < ActionMailer::Base
  default from: ENV["SITE_EMAIL"]
  

    def staff_message(message)
        @message = message
    
        mail to: message.staff_email, :reply_to => message.email, subject: "Message from #{message.name}  - #{message.subject} "
      
    end
end
