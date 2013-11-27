module BulletinsHelper
  include ActionView::Helpers::TagHelper
  include ActionView::Context   


  def bulletin_name(bulletin)
    
       content_tag(:span, "#{bulletin.display_start.strftime("%B %d")} - #{bulletin.display_till.strftime("%d, %Y")}") 
  end  

  def bulletin_advert_main_page(bulletin)
    if bulletin.advert_main_page?
      content_tag(:div, content_tag(:span, "Yes"), class: "label label-success")
    else
      content_tag(:div, content_tag(:span, "No"), class: "label label-warning")   
    end   
  end
  
  def bulletin_members_only(bulletin)
    if bulletin.members_only?
      content_tag(:div, content_tag(:span, "Yes"), class: "label label-success")
    else
      content_tag(:div, content_tag(:span, "No"), class: "label label-warning")   
    end   
  end
  
 
  
  def display_bulletin_picture(bulletin)
 
      if bulletin.image_processed?  
        link_to(image_tag(bulletin.bulletin_image_url(:thumb), :class =>"img-rounded"  ), bulletin_path(bulletin)) 
      else
        return link_to(image_tag(placeholder_image_url "137x250", :text => "Oops-No Picture", :bg => "000", :fg => "667"), bulletin_path(bulletin)) 
      end 
   
  end  
  


end


