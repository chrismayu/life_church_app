module MinistriesHelper
  
 
 
  def ministries_menu(ministries)
    
       html = link_to "#{ministries.name}", ministry_path(ministries)
      # content_tag(:li, link_to "#{ministries.name}", ministry_path(ministries))  
       
  #  html.html_safe
      
  end
 
 
 

  def display_ministry_child_picture(ministry_children)

       if ministry_children.ministry_picture_children.present?  
       for event_picture in ministry_children.ministry_picture_children  
       if event_picture.image_processed?  
             return link_to(image_tag(event_picture.ministrychild_image_url(:thumb), :class =>"img-rounded"), ministry_child_path(ministry_children)) 
        
         end  
       end  
        else
          return link_to(image_tag(placeholder_image_url "200x200", :class =>"img-rounded"), ministry_child_path(ministry_children)) 

     
       end  
       
        #return image_tag (placeholder_image_url "652x452")
       
    end
  
  
end
