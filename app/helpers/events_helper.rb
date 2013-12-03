module EventsHelper
  
  
  
  def display_event_picture(event_pictures)
  
      if event_pictures.event_pictures.present?  
      for event_picture in @event.event_pictures  
        if event_picture.image_processed?  
          return image_tag event_picture.event_image_url(:main), :class =>"img-rounded pull-center"   
       
        
        end  
      end  
    else

    
       # return link_to(image_tag(placeholder_image_url "486x276", :text => "#{event_pictures.event_name} - Picture soon", :bg => "000", :fg => "667"), event_path(event_pictures)) 
        return link_to(image_tag(placeholder_image_url "652x484", :text => "#{event_pictures.event_name}", :bg => "E8117F", :fg => "667",:padding =>"33px"), event_path(event_pictures)) 
   
   end 
   end  
  
  
   def display_sidebar_event_picture(event_pictures)

       if event_pictures.event_pictures.present?  
         for event_picture in event_pictures.event_pictures  
          if event_picture.image_processed?  
            return link_to(image_tag(event_picture.event_image_url(:side)), event_path(event_pictures)) 
            
                 
              
          end  
         end 
       
        else

        
            return link_to(image_tag(placeholder_image_url "216x150", :text => "#{event_pictures.event_name}", :bg => "E8117F", :fg => "667",:padding =>"33px"), event_path(event_pictures)) 
       end
       
       # return image_tag (placeholder_image_url "216x150")   
    end
  
  
   def display_carousel_event_picture(event_pictures)

       if event_pictures.event_pictures.present?  
       for event_picture in event_pictures.event_pictures  
       if event_picture.image_processed?  
            return link_to(image_tag(event_picture.event_image_url(:main)), event_path(event_pictures)) 
          
         
         end  
       end  
        else

        # return image_tag (placeholder_image_url "652x484",:text => "#{event_pictures.event_name}")
         return link_to(image_tag(placeholder_image_url "652x484", :text => "#{event_pictures.event_name}", :bg => "E8117F", :fg => "667",:padding =>"33px"), event_path(event_pictures)) 
         
       end  
       
        #return image_tag (placeholder_image_url "652x452")
       
    end  
  
  
  
  
    def placeholder_image_url(size="200x150", *args)
      options = args.extract_options!
      # If fg is present, bg is required (and vice versa)
      options[:bg] = "FFF" if options[:fg].present? && options[:bg].blank?	
      options[:fg] = "000" if options[:bg].present? && options[:fg].blank?
      parts = []
      parts << "http://placehold.it"
      parts << "/#{size}"
      parts << "/#{options[:bg]}" if options[:bg].present?
      parts << "/#{options[:fg]}" if options[:fg].present?
      parts << "&text=#{options[:text]}" if options[:text].present?
      parts.join ""
    end
 
 
  
  
  def status_display_main_page(ministries)
    if ministries.display_main_page?
      content_tag(:div, content_tag(:span, "Yes"), class: "label label-success")
    else
      content_tag(:div, content_tag(:span, "No"), class: "label label-warning")   
    end   
  end
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
end
