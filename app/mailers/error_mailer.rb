class ErrorMailer < ActionMailer::Base
  default from: ENV["return_email_address"]
  
  
  def found_error
     @greeting = "Hi"

     mail to: ENV["ADMIN_EMAIL"]
   end
end
