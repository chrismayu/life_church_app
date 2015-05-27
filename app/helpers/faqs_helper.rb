module FaqsHelper
  
  def faq_markdown(text)
    
    if text !=nil 
    return markdown(text)
  else
    return " empty"
  end
  
  
  end  
    
  
end
