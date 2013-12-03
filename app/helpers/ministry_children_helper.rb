module MinistryChildrenHelper
  
 
  def status_advert_main_page_ministry_child(ministries)
    if ministries.advert_main_page?
      content_tag(:div, content_tag(:span, "Yes"), class: "label label-success")
    else
      content_tag(:div, content_tag(:span, "No"), class: "label label-warning")   
    end   
  end
  
  def display_ranking(ministries)
 
    if ministries.display_rank !=nil
      content_tag(:div, content_tag(:span, "#{ministries.display_rank}"), class: "label label-info")
    else
      content_tag(:div, content_tag(:span, "N/A"), class: "label label-info")
    end
    
      end
 
end
