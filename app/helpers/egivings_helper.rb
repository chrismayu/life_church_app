module EgivingsHelper
  
  
 
  def tax_reciept_year
    
    if Time.now.month.to_i == 1 || Time.now.month.to_i == 2
      Time.now.year
    else
      Time.now.year + 1
    end
  
 end
  
  
  def email_of_giver(egiving)
    
    if egiving.email_of_giver.blank?
      content_tag(:dt, content_tag(:strong, "Giver's Email:"))  
      content_tag(:dd, egiving.email_of_giver )  
     end
     
  end
  
  
 def send_receipt(egiving)
 
 unless egiving.send_email_giver.nil?
   
   if egiving.send_email_giver?     #home_address == false 
      content_tag(:div, content_tag(:span, "Yes, Please send Tax Receipt"), class: "label label-success")
    else
      content_tag(:div, content_tag(:span, "No, I do not want a Tax Receipt"), class: "label label-inverse")   
    end
   
 end
 
 
 end
 
 def send_receipt_email(egiving)
 
 unless egiving.send_email_giver.nil?
   
   if egiving.send_email_giver?     #home_address == false 
      content_tag(:div, content_tag(:span, "Yes, Please send Tax Receipt"))
    else
      content_tag(:div, content_tag(:span, "No, I do not want a Tax Receipt"))   
    end
   
    
 end
 
 
 end
 
 
  
end

 