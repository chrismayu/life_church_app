class ThanksMailer < ActionMailer::Base
    default from: ENV["return_email_address"]

 
  def thankyou(egiving)
    @greeting =  "Received Your E Gift"
    @egiving = egiving
    
    
    attachments.inline['LifeLogo.png'] = {
                                    :data => File.read("#{Rails.root.to_s + '/app/assets/images/LifeLogo.png'}"),
                                    :mime_type => "image/png"
                                  }
    mail to: egiving.email_of_giver, subject: "Received Your E Gift"
  end

 
  def thankyouus(egiving)
   @greeting =  "Received Your E Gift"
   @egiving = egiving
   attachments.inline['LifeLogo.png'] = {
                                   :data => File.read("#{Rails.root.to_s + '/app/assets/images/LifeLogo.png'}"),
                                   :mime_type => "image/png"
                                 }
    mail to: egiving.email_of_giver, subject: "Received Your E Gift"
  end
  
  def thankyouother(egiving)
   @greeting =  "Received Your E Gift"
   @egiving = egiving
   attachments.inline['LifeLogo.png'] = {
                                   :data => File.read("#{Rails.root.to_s + '/app/assets/images/LifeLogo.png'}"),
                                   :mime_type => "image/png"
                                 }
    mail to: egiving.email_of_giver, subject: "Received Your E Gift"
  end

end
