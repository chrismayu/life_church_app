module ChurchStaffsHelper
  
  
  
  def display_sidebar_staff(staffs)

      if staffs.church_staff_pictures.present?  
        for staff in staffs.church_staff_pictures  
         if staff.image_processed?  
           return  image_tag(staff.staff_image_url(:main), :class =>"img-rounded") 
         else
                
           return  image_tag("empty_staff_1.png", size: "220x205", :class =>"img-rounded" )
         end  
        end 
      
       else
        return  image_tag("empty_staff_1.png", size: "220x205", :class =>"img-rounded" )
        
      end
   end
   
    
    
    
   
   
   
end
