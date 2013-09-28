module EventsHelper
  
  
  
  def display_event_picture(event_pictures)
  
      if event_pictures.event_pictures.present?  
      for event_picture in @event.event_pictures  
        if event_picture.image_processed?  
          return image_tag event_picture.event_image_url(:main), :class =>"img-rounded"   
       
        
        end  
      end  
      end  
   end  
  
  
   def display_sidebar_event_picture(event_pictures)

       if event_pictures.event_pictures.present?  
         for event_picture in event_pictures.event_pictures  
          if event_picture.image_processed?  
            return image_tag event_picture.event_image_url(:side)   
          end  
         end 
       
        else

          return image_tag (placeholder_image_url "216x151", :text => "Oops-No Picture", :bg => "000", :fg => "667") 
          
       end
       
       # return image_tag (placeholder_image_url "216x151")   
    end
  
  
   def display_carousel_event_picture(event_pictures)

       if event_pictures.event_pictures.present?  
       for event_picture in event_pictures.event_pictures  
       if event_picture.image_processed?  
            return image_tag event_picture.event_image_url(:main) 
          
         
         end  
       end  
        else

         return image_tag (placeholder_image_url "652x452")
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
 
  
  
  
  
end
