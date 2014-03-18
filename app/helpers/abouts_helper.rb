module AboutsHelper
  
  
  def twitter_link(twitter)
    
    link = "www.twitter.com/#{twitter}"
    link
  end
  
  def facebook_link(about)
 
    
    link = "www.facebook.com/#{about}"
    link
  end
  
  def youtube_link(about)
    
  end
  
  def video_link(about)
    
    
  end
  
  
  
  
  
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
  
  def status_shutdown(about)
    if about.shutdown?
      content_tag(:div, content_tag(:span, "Maintainence Mode"), class: "label label-warning")
    else
      content_tag(:div, content_tag(:span, "Normal"), class: "label label-success")   
    end   
  end
  
  
end
