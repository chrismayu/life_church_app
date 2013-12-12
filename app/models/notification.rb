class Notification < ActiveRecord::Base
  attr_accessible :email_1, :email_2, :open_site, :send_email_2
  
       validates_formatting_of :email_1, :using => :simple_email, :message => "Invalid Email"
  
   
end
