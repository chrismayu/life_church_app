module LifePulsesHelper
 
 
 
  def stamp_stock_image_display(life_pulse)
 
    if life_pulse.flickr_id.present?
      
     id = life_pulse.flickr_id
     
     life_pulse_stock_picture = LifePulseStockPicture.find(id)
      
    if life_pulse_stock_picture.image_processed?  
      return image_tag life_pulse_stock_picture.life_pulse_stock_image_url(:stamp), :class =>"img-rounded pull-center" 
    else
     return  image_tag(placeholder_image_url "100x70",   :bg => "E0E1E2", :fg => "667",:padding =>"33px") 
    end  
    
  else
    
   return  image_tag(placeholder_image_url "100x70", :bg => "E0E1E2", :fg => "667",:padding =>"33px") 
   
  end
     
 
 
 
  end
  def stock_image_display(life_pulse)
 
    if life_pulse.flickr_id.present?
      
     id = life_pulse.flickr_id
     
     life_pulse_stock_picture = LifePulseStockPicture.find(id)
      
    if life_pulse_stock_picture.image_processed?  
      return image_tag life_pulse_stock_picture.life_pulse_stock_image_url(:stamp), :class =>"img-rounded pull-center" 
    else
     return  image_tag(placeholder_image_url "652x484",   :bg => "E0E1E2", :fg => "667",:padding =>"33px") 
    end  
    
  else
    
   return  image_tag(placeholder_image_url "652x484", :bg => "E0E1E2", :fg => "667",:padding =>"33px") 
   
  end
     
 
 
 
  end
  
  
 
 
    def display_life_pulse_picture(life_pulse)
  
      if life_pulse.life_pulse_pictures.present?  
      for life_pulse_picture in life_pulse.life_pulse_pictures 
          if life_pulse_picture.image_processed?  
            return image_tag life_pulse_picture.life_pulse_image_url(:main), :class =>"img-rounded pull-center life_pulse_left" 
           
        
          end  
        end  
      else
 
        stock_image_display(life_pulse)
 
         # return link_to(image_tag(placeholder_image_url "652x484", :text => "#{life_pulse.title.html_safe}", :bg => "E0E1E2", :fg => "667",:padding =>"33px"), life_pulse_path(life_pulse)) 
   
     end 
     
     
     
     
     
     
     
     
     
     
     end  
  
  
     def stamp_life_pulse_picture(life_pulse)
  
  
         if life_pulse.life_pulse_pictures.present?  
         for life_pulse_picture in life_pulse.life_pulse_pictures 
           if life_pulse_picture.image_processed?  
               #return image_tag life_pulse_picture.life_pulse_image_url(:stamp), :class =>"img-rounded pull-center" 
           
           
               return link_to(image_tag(life_pulse_picture.life_pulse_image_url(:stamp), :class =>"img-rounded pull-center" ), life_pulse_path(life_pulse)) 
       
            end  
         end  
       else
      
         stamp_stock_image_display(life_pulse)
 
           #return link_to(image_tag(placeholder_image_url "100x70", :text => "#{life_pulse.title.html_safe}", :bg => "E0E1E2", :fg => "667",:padding =>"33px"), life_pulse_path(life_pulse)) 
   
      end 
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
