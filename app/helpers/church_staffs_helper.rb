module ChurchStaffsHelper
  
  
  
  def contact_staff_email(staff)
    
    if staff.rank == 1 
      return link_to t('.new', :default => t(" Contact Pastor #{staff.last_name}")),
  			                      contact_staff_path(:staff => staff.email_id) 
    else
      
    return link_to t('.new', :default => t("helpers.links.Contact #{staff.first_name}")),
			                      contact_staff_path(:staff => staff.email_id) 
                          end
  end
  
  
  
  
  def staff_details(staff)
     
    email(staff) +
    url(staff) +
    birth_location(staff)
    birthday(staff) +
     spouse(staff) + 
    facebook(staff) +
    google_plus(staff) +
    linkedin(staff) +
    twitter(staff) +
    length_service(staff)
    
  end
  
  
  def email(staff)
    
    content_tag(:p, content_tag(:i," ", class: "icon-envelope") + contact_staff_email(staff))
 
  end
  
  def url(staff)
    
	    unless staff.url.blank?
        content_tag(:p, content_tag(:i," ", class: "icon-globe") + link_to(" Blog", staff.url) )
      end
      			
  end
  
  def birthday(staff)
    
	    unless staff.birthday.blank?
        content_tag(:p, content_tag(:i," ", class: "icon-gift") + staff.birthday.strftime(" %B #{ staff.birthday.day.ordinalize}") )
      end
      			
  end
 
 
 
  def facebook(staff)
    
	    unless staff.facebook.blank?
        content_tag(:p, content_tag(:i," ", class: "icon-facebook") + link_to(" Facebook", staff.facebook))
      end
      			
  end
  
  
  def linkedin(staff)
    
	    unless staff.linked_in.blank?
        content_tag(:p, content_tag(:i," ", class: "icon-linkedin") + link_to(" Linkedin", staff.linked_in))
       end
  
 end
   
  
  def twitter(staff)
    
	    unless staff.twitter.blank?
        content_tag(:p, content_tag(:i," ", class: "icon-twitter") + link_to(" Twitter", staff.twitter))  			
      end
  
end 
  
  def google_plus(staff)
    
	    unless staff.google_plus.blank?
        content_tag(:p, content_tag(:i," ", class: "icon-google-plus") + link_to(" Google Plus", staff.google_plus))  			
      end
  
end 
  
  
  
  def spouse(staff)
    
		  unless staff.spouse_first_name.blank? 
     content_tag(:p, content_tag(:i," ", class: "icon-smile") + " #{staff.spouse_first_name.capitalize}")
      end   
 end
  
 def length_service(staff)
   
  
    unless staff.started_service.blank?  	
        if staff.started_service?  
       "Length of Service:" + time_ago_in_words(staff.started_service.to_formatted_s(:long) )    
        end    
   end    
  
 end
  
  def birth_location(staff)
  
  
     unless staff.birth_location.blank?
     content_tag(:p, content_tag(:i," ", class: "icon-icon-map-marker") + "  #{staff.birth_location.capitalize}" + tag(:br))
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
