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
   
   
   
 
   
  def getspeaker(sermon)

  			 speaker = sermon.speaker 
  				
  				 @code =  content_tag(:span, "#{speaker.title} #{speaker.full_name}")           
 
       return @code
       
       
  end
  
  
  def show_sermon(sermon, member_only)
     string = ""
     if sermon.members_only == false
      string = sort_by_date(sermon)
    else
      
      if member_only == true
      string = sort_by_date(sermon)
      end
      
     end
     
     string
  end
  
  
  def sort_by_date(sermon)
        string = ""
 
           if sermon.display_until >= DateTime.now 
         
               if sermon.date_of_sermon <= DateTime.now
                string = string + (render partial: "sermon",  :locals => {:sermon => sermon}).to_s.html_safe  
               end
          
           end   
          
        string
      
      end
  
  
      def member_only_label(sermon)
        if sermon.members_only?
            content_tag(:div, content_tag(:span, "Member's Only"), class: "label").html_safe  
        else
          
        end   
      end
  
      
  
   
   
end
