module ChurchStaffsHelper
  
  
  
  def contact_staff_email(staff)
    
    if staff.rank == 1 
      return link_to t('.new', :default => t("helpers.links.Contact Pastor #{staff.last_name}")),
  			                      contact_staff_path(:staff => staff.email_id) 
    else
      
    return link_to t('.new', :default => t("helpers.links.Contact #{staff.first_name}")),
			                      contact_staff_path(:staff => staff.email_id) 
                          end
  end
  
  
  
  
  
  
  def display_sidebar_staff(staffs)

      if staffs.church_staff_pictures.present?  
        for staff in staffs.church_staff_pictures  
         if staff.image_processed?  
           return  image_tag(staff.staff_image_url(:main), :class =>"img-rounded") 
         else
                
           return  image_tag("empty_staff_1.png", size: "220x220", :class =>"img-rounded" )
         end  
        end 
      
       else
        return  image_tag("empty_staff_1.png", size: "220x220", :class =>"img-rounded" )
        
      end
   end
   
    
    
   def count_display
    content_tag(:div, "", class: "countdown")  
   end
   
   
   def remained
    content_tag(:div, t('.characters_remaining').html_safe, class: "remaining")        
   end
   
   
end
