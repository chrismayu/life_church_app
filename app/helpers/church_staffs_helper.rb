module ChurchStaffsHelper
  
  
  
  def display_sidebar_staff(staffs)

      if staffs.church_staff_pictures.present?  
        for staff in staffs.church_staff_pictures  
         if staff.image_processed?  
           return link_to(image_tag(staff.taff_image_url(:main), :class =>"img-rounded"), learn_more_path(staffs)) 
         else
                
           return  image_tag("empty_staff.png", :class =>"img-rounded" )
         end  
        end 
      
       else
        return  image_tag("empty_staff.png", :class =>"img-rounded" )
        
      end
   end
   
    
   
   
   def staff_details(church_staff)
  
   
      # <blockquote>
 #        <p><strong> <%= church_staff.first_name %> <%= church_staff.last_name %> </strong></p>  
 #            <em> <%= church_staff.title %> </em><br>
 #        <small><cite title="Source Title"><%= church_staff.birth_location %>  <i class="icon-map-marker"></i></cite></small>
 #      </blockquote>
 #   
 #      <p>
 #       <i class="icon-envelope"></i> <%= link_to t('.new', :default =>  t("helpers.links.Contact")),
 #                         contact_staff_path(:staff => church_staff.email_id), :class => 'btn   btn-success btn-mini-flat' %><br>
       
 
     
       if church_staff.url?
          return content_tag(:i, content_tag(:p, church_staff.url), class: "icon-globe") 
      end 
     
     
     
       if church_staff.birthday?
          return content_tag(:i, content_tag(:p, church_staff.birthday), class: "icon-gift") 
       end 
     
 
      if church_staff.spouse_first_name?
         return  content_tag(:i, content_tag(:span, church_staff.spouse_first_name), class: "icon-smile") 
      end           
           
        
      if church_staff.facebook?
         return content_tag(:i, content_tag(:p, church_staff.facebook), class: "icon-facebook") 
     end 
     
     
     
     if church_staff.linked_in?
        return content_tag(:i, content_tag(:p, church_staff.linked_in), class: "icon-linkedin") 
    end 
    
    
    if church_staff.google_plus?
       return content_tag(:i, content_tag(:p, church_staff.google_plus), class: "icon-google-plus") 
   end   
        
      if church_staff.twitter?
        return content_tag(:i, content_tag(:p, church_staff.twitter), class: "icon-twitter") 
      end   
      
      
      if church_staff.description !=nil
         return content_tag(:p, church_staff.description, class: "pull-left staff_bg") 
     end     
 
 
     if church_staff.started_service?
       
        
        return time_ago_in_words(church_staff.started_service.to_formatted_s(:long))
     
            
    end 
 
    
   end
   
   
   
end
