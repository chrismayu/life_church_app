module AboutsHelper
  
  
  def status_video(about)
    if about.video?
      content_tag(:div, content_tag(:span, "Visible"), class: "label label-success")
    else
      content_tag(:div, content_tag(:span, "Not Enabled"), class: "label label-warning")   
    end   
  end
  
  def status_article(about)
    if about.articles?
      content_tag(:div, content_tag(:span, "Visible"), class: "label label-success")
    else
      content_tag(:div, content_tag(:span, "Not Enabled"), class: "label label-warning")   
    end   
  end
  
  def status_life_pulse(about)
    if about.life_pulse?
      content_tag(:div, content_tag(:span, "Visible"), class: "label label-success")
    else
      content_tag(:div, content_tag(:span, "Not Enabled"), class: "label label-warning")   
    end   
  end
 
  def status_leaders_blog(about)
    if about.leaders_blog?
      content_tag(:div, content_tag(:span, "Visible"), class: "label label-success")
    else
      content_tag(:div, content_tag(:span, "Not Enabled"), class: "label label-warning")   
    end   
  end

  def status_store(about)
    if about.store?
      content_tag(:div, content_tag(:span, "Visible"), class: "label label-success")
    else
      content_tag(:div, content_tag(:span, "Not Enabled"), class: "label label-warning")   
    end   
  end
  
  
end
