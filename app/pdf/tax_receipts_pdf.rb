class TaxReceiptsPdf < Prawn::Document
    def initialize(egiving, view)
      super(top_margin: 70)
      @egiving = egiving
      @view = view
      logo
      giver_info
       
      
      
     
      
      
    end

   def giver_info
     
     test_size = 14
     
     move_down 40
       text "First Name:  #{@egiving.first_name}", size: test_size
     move_down 3
       text "Last Name:  #{@egiving.last_name}", size: test_size
    move_down 12
       text "Address:  #{@egiving.address}", size: test_size
      move_down 3
        text "Province:  #{@egiving.province}", size: test_size
        move_down 3
         text "Country:  #{@egiving.country}", size: test_size
        move_down 3  
          text "Postal Code:  #{@egiving.postal_code}", size: test_size
        move_down 12  
           text "Phone Number:  #{@egiving.phone_number}", size: test_size
          move_down 3  
            text "Email Address:  #{@egiving.email_of_giver}", size: test_size
            move_down 12   
               text "Amount of Donation:  #{amount(@egiving.finalamount)}", size: test_size
               move_down 3  
                text "Propose of Donation:  #{@egiving.propose_of_donation}", size: test_size
            
                move_down 3  
                  text "Date of Donation:  #{@egiving.created_at.strftime("%l:%M %p on %B %e, %Y ")}", size: test_size
  
     
     

end


def amount(num)
   @view.number_to_currency(num)
 end


    def logo
     y_position = cursor
   
      image "#{Rails.root}/app/assets/images/LifeLogo.png", :position => :left,
      :vposition => 0
     # text "#{cursor}"
      
      move_cursor_to 675
      
       y_position = cursor
       
       
         text_box "EGiving Tax Receipt", size: 26, style: :bold, :at => [300, y_position],
          :width => 300
          #text "#{cursor}"
              move_cursor_to 640

               y_position = cursor
       
             # text_box "\##{@egiving.id}", size: 24, style: :bold, :at => [500, y_position],
               #   :width => 300
                 # text "#{cursor}"
      move_down 20
    end





  end