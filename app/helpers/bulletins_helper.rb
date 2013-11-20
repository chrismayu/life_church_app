module BulletinsHelper


  def bulletin_name(bulletin)
    
       content_tag(:span, "#{bulletin.display_start.strftime("%B %d")} - #{bulletin.display_till.strftime("%d, %Y")} " )
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


end


