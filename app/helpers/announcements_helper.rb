module AnnouncementsHelper
  
  def display_status_of_announcement(announcement) 
    
    now = Time.zone.now
    
    if announcement.starts_at <= now && announcement.ends_at >= now 
      
      return content_tag(:div, content_tag(:span, "Active"), class: "label label-success")  
      
    else
      
      if announcement.starts_at >= now  
        return content_tag(:div, content_tag(:span, "Pending"), class: "label label-info")  
      end
      
      if announcement.ends_at <= now  
        return content_tag(:div, content_tag(:span, "Expired"), class: "label label-important")  
      end
      
    end

  end
  
  
  def alert_colour(announcement)
    
    
    case announcement.colours
      when 'success'
        return content_tag(:div, content_tag(:span, "Green"), class: "label label-success") 
      when 'error'
        return content_tag(:div, content_tag(:span, "Red"), class: "label label-important") 
      when 'info'
        return content_tag(:div, content_tag(:span, "Blue"), class: "label label-info") 
      when 'warning'
        return content_tag(:div, content_tag(:span, "Yellow"), class: "label label-warning") 
    end
    
    
    
  end  
  
  
  
 
end
