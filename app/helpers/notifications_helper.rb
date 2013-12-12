module NotificationsHelper
        
   def tax_reciept_year

     if Time.now.month.to_i == 1 || Time.now.month.to_i == 2
       Time.now.year
     else
       Time.now.year + 1
     end

  end
  
end
