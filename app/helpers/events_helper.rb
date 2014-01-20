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
        return link_to(image_tag(placeholder_image_url "652x484", :text => "#{event_pictures.event_name.html_safe}", :bg => "E0E1E2", :fg => "667",:padding =>"33px"), event_path(event_pictures)) 
   
   end 
   end  
  
  
   def display_sidebar_event_picture(event_pictures)

       if event_pictures.event_pictures.present?  
         for event_picture in event_pictures.event_pictures  
          if event_picture.image_processed?  
            
            if event_pictures.recurring_on? || event_pictures.advertisement? 
            return  image_tag(event_picture.event_image_url(:side)) 
          else
            return link_to(image_tag(event_picture.event_image_url(:side)), event_path(event_pictures)) 
       
          end
                 
              
          end  
         end 
       
        else

        if event_pictures.recurring_on? || event_pictures.advertisement? 
            return  image_tag(placeholder_image_url "216x150", :text => "#{event_pictures.event_name.html_safe}", :bg => "E0E1E2", :fg => "667",:padding =>"33px") 
          else
            return link_to(image_tag(placeholder_image_url "216x150", :text => "#{event_pictures.event_name.html_safe}", :bg => "E0E1E2", :fg => "667",:padding =>"33px"), event_path(event_pictures)) 
        
          end
       
       
       
       end
       
       # return image_tag (placeholder_image_url "216x150")   
    end
   
   def display_carousel_event_picture(event_pictures)

       if event_pictures.event_pictures.present?  
       for event_picture in event_pictures.event_pictures  
       if event_picture.image_processed?  
           if event_pictures.recurring_on? || event_pictures.advertisement? 
            return  image_tag(event_picture.event_image_url(:main))  
          else
            return link_to(image_tag(event_picture.event_image_url(:main)), event_path(event_pictures)) 
          end
         
         end  
       end  
        else

 
         
         if event_pictures.recurring_on? || event_pictures.advertisement? 
         return  image_tag(placeholder_image_url "652x484", :text => "#{event_pictures.event_name.html_safe}", :bg => "E0E1E2", :fg => "667",:padding =>"33px") 
       else
         return link_to(image_tag(placeholder_image_url "652x484", :text => "#{event_pictures.event_name.html_safe}", :bg => "E0E1E2", :fg => "667",:padding =>"33px"), event_path(event_pictures)) 
  
       end
         
         
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
 
    def event_happen_when(event)
      
      
      if event.event_date !=nil
      
      date = event.event_date.strftime("%B #{event.event_date.day.ordinalize}, %Y")
      weekday = event.recurring_day
      time = event.event_start_time.strftime("%l:%M %p")
      
       if event.recurring_on?
         "Every #{weekday} at #{time}"  
      else
        
        "Starts #{date} at #{time}" 
      end  
      
    end 
    end
  
  
  def status_display_main_page(ministries)
    if ministries.display_main_page?
      content_tag(:div, content_tag(:span, "Yes"), class: "label label-success")
    else
      content_tag(:div, content_tag(:span, "No"), class: "label label-warning")   
    end   
  end
  
  
  def which_form_used(form)
    
    @from = EventSetupForm.where(:id => form.which_form).last
    return @from.form_title
    
  end
  
  
  def event_form_bool(item)
    if item == true
      content_tag(:div, content_tag(:span, "Enabled"), class: "label label-success")
    else
      content_tag(:div, content_tag(:span, "Not Used"), class: "label label-warning")   
    end   
  end
  
  def eventsetupform(event)

    @eventsetup = EventSetupForm.where(:event_id => event.id).all

    if @eventsetup.count >= 1
      return true
    else
      return false
    end    

  end
  
  
  
  
  
  
  
  
  
  
  
  
end
