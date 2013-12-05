module EventSetupFormsHelper
  
  
  
  
  def event_setup_form_bool(item)
    if item == true
      content_tag(:div, content_tag(:span, "Enabled"), class: "label label-success")
    else
      content_tag(:div, content_tag(:span, "Not Used"), class: "label label-warning")   
    end   
  end
  
end
