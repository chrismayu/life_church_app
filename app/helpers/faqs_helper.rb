module FaqsHelper
  
  
  
  
      def faq_label(faq, member = false)
        
        
         if member == false
         
         
        if faq.member_only?
  
          html = <<-HTML
          <span class="label"> <i class="icon-lock"></i>Member's Only</span>
          HTML
        else 
          
           html = ""
         
         end
  
          #  html = <<-HTML
          #  <span class="label label-success"> <i class="icon-unlock"></i>Member's Only</span>
           # HTML
            
 
        else
          if faq.member_only?
  
            html = <<-HTML
            <span class="label label-success"> <i class="icon-unlock"></i>Member's Only</span>
            HTML
          else 
          
             html = ""
           end  
        
        end   
 
        html.html_safe
      end
      
      
      
  
      
  
   
 
  
  
  def faq_markdown(text)
    
    if text !=nil 
    return markdown(text)
  else
    return " empty"
  end
  
  
  end  
    
  
end
