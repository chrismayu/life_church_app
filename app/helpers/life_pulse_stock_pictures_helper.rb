module LifePulseStockPicturesHelper
  
  
  def display_life_pulse_stock_picture(life_pulse)
 
    if life_pulse.image_processed?  
      return image_tag life_pulse.life_pulse_stock_image_url(:stamp), :class =>"img-rounded pull-center" 
    else
     return  image_tag(placeholder_image_url "200x200", :text => "#{life_pulse.title.html_safe}", :bg => "E0E1E2", :fg => "667",:padding =>"33px") 
    end  
 
  end   
  
 
  def link_life_pulse_stock_picture(life_pulse)


    if life_pulse.image_processed?  
        return link_to(image_tag(life_pulse.life_pulse_stock_image_url(:stamp), :class =>"img-rounded pull-center" ), life_pulse_stock_picture_path(life_pulse_stock_picture)) 
    else
     return  image_tag(placeholder_image_url "200x200", :text => "#{life_pulse.title.html_safe}", :bg => "E0E1E2", :fg => "667",:padding =>"33px") 
    end  

end

 
 

  
  
end
