module SchedulesHelper
  include ActionView::Helpers::TagHelper
  include ActionView::Context   


  def schedule_name(schedule)
    
       content_tag(:span, " #{schedule.start_month.strftime("%B #{schedule.start_month.day.ordinalize}, %Y")}") 
  end   

  def schedule_advert_main_page(schedule)
    if schedule.advert_main_page?
      content_tag(:div, content_tag(:span, "Yes"), class: "label label-success")
    else
      content_tag(:div, content_tag(:span, "No"), class: "label label-warning")   
    end   
  end
  
  def schedule_members_only(schedule)
    if schedule.members_only?
      content_tag(:div, content_tag(:span, "Yes"), class: "label label-success")
    else
      content_tag(:div, content_tag(:span, "No"), class: "label label-warning")   
    end   
  end
  
 
  
  def display_schedule_picture(schedule)
 
      if schedule.image_processed?  
        link_to(image_tag(schedule.schedule_image_url(:thumb), :class =>"img-rounded"  ), schedule_path(schedule)) 
      else
        return link_to(image_tag(placeholder_image_url "137x250", :text => "Oops-No Picture", :bg => "000", :fg => "667"), schedule_path(schedule)) 
      end 
   
  end  
  


end


