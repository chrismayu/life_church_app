module ChurchStaffsHelper
  
  
  
  def display_sidebar_staff(staffs)

      if staffs.church_staff_pictures.present?  
        for staff in staffs.church_staff_pictures  
         if staff.image_processed?  
           return link_to(image_tag(staff.staff_image_url(:main), :class =>"img-rounded"), learn_more_path(staffs)) 
         else
                
           return  image_tag("empty_staff.png", :class =>"img-rounded" )
         end  
        end 
      
       else
        return  image_tag("empty_staff.png", :class =>"img-rounded" )
        
      end
   end
   
    
    
    
   
   
   
end
