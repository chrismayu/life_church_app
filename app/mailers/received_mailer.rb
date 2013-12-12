class ReceivedMailer < ActionMailer::Base

 default from: ENV["return_email_address"]
  
  
  def new_e_giving(egiving, email)
     @notification = Notification.last
    
     @greeting = "Received E Gift"
     @egiving = egiving
     @email = email
     
     mail to: email, subject: "Received New E Gift"
   end
  
end 