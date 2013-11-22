module SermonsHelper
  
  
  
  def display_sermon(sermons)

      if sermons.sermon_pictures.present?  
        for sermon in sermons.sermon_pictures  
         if sermon.image_processed?  
           return link_to(image_tag(sermon.sermon_image_url(:main), :class =>"img-rounded"), sermon_path(sermons)) 
         else
                
           return  image_tag("empty_staff.png", :class =>"img-rounded" )
         end  
        end 
      
       else
        return  image_tag("empty_staff.png", :class =>"img-rounded" )
        
      end
   end
   
   
   
end
