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
  
  
      def member_only_label(sermon, member = false)
        if sermon.members_only?
  
            html = <<-HTML
            <span class="label label-success"> <i class="icon-unlock"></i>Member's Only</span>
            HTML
            
 
        else
           if member == true
          html = <<-HTML
          <span class="label"> <i class="icon-lock"></i>Member's Only</span>
          HTML
        else
          html = ""
        end
        end   
        
        html.html_safe
      end
      
      
      
  
      
  
   
   
end
