require 'spec_helper'

describe Event do
  
  describe "event date is before event remove date" do
    
    it "event date is bore remove date" do
    FactoryGirl.build(:event_full, event_date: "2013-09-23" , remove_event_date: "2013-09-24" ).should be_valid 
    end
 
    it "if remove date is before start" do
    FactoryGirl.build(:event_full, event_date: "2013-09-25" , remove_event_date: "2013-09-23" ).should_not be_valid 
    end
    
    
  
  end  
  
  describe "Max number of event forced on main page - " do
  
    before :each do
     @event_type_ads_only_11 =  FactoryGirl.create(:ads_only, display_main_page:true, force_on_main_page:true)  
    @event_type_ads_only_11_2 =  FactoryGirl.create(:ads_only, display_main_page:true, force_on_main_page:true) 
     end 
 
  
     it "2 event are okay" do
      @event_type_ads_only_11.max_forced_on_main_page_advertisments.should be_true
    end
     
     it "three events are okay" do   
     third =  FactoryGirl.create(:ads_only, display_main_page:true,  force_on_main_page:true) 
     third.max_forced_on_main_page_advertisments.should be_true
     end
  
     it "4 event - not okay"do
     third =  FactoryGirl.create(:ads_only, display_main_page:true,  force_on_main_page:true) 
     fourth =  FactoryGirl.build(:ads_only, display_main_page:true,  force_on_main_page:true) 
     fourth.max_forced_on_main_page_advertisments.should be_false
     end
  
   end
  
  
    describe "Full Event" do
     
        it "is event_full Factory is valid" do 
           FactoryGirl.build(:event_full).should be_valid
        end 
      
        it "is invalid without a Name" do  
          FactoryGirl.build(:event_full, event_name: nil).should_not be_valid 
        end 
        
        it "is invalid without a Name" do  
          FactoryGirl.build(:event_full, event_type: nil).should_not be_valid 
        end 

        it "is invalid without a Email" do  
          FactoryGirl.build(:event_full, contact_email: nil).should_not be_valid 
        end 
        
        it "is invalid When Display on main is true when Force on main is false" do  
          FactoryGirl.build(:event_full, display_main_page: false, force_on_main_page:true).should_not be_valid 
        end 
  
        
        
        
      
    end     
       
       
      describe "Ad Only" do     
       
       
       
       
          it "is Ad Only Factory is valid" do 
             FactoryGirl.build(:ads_only).should be_valid
          end 
      
      end  
      
      
      
  describe "Cal Only" do     
    
      it "is Ad Only Factory is valid" do 
         FactoryGirl.build(:cal_only).should be_valid
      end 
      
  end  
      
      
      
      
      

      it "is invalid without a Name" do  
        #FactoryGirl.build(:event, name: nil).should_not be_valid 
      end 

      it "is invalid without a Email" do  
       # FactoryGirl.build(:event, email: nil).should_not be_valid 
      end 
  
      it "is invalid without a Subject" do  
       # FactoryGirl.build(:event, subject: nil).should_not be_valid 
      end 

      it "is invalid without a Body" do  
       # FactoryGirl.build(:event, body: nil).should_not be_valid 
      end 
  
      it "is invalid without a Proper Email" do  
        #FactoryGirl.build(:event, email: "chid").should_not be_valid 
      end 
  
    
      
      
      describe "Check Comparions" do
    
        before :each do
         @event_type_ads_only_11 =  FactoryGirl.create(:ads_only) 
         @event_type_full_event_12 =  FactoryGirl.create(:event_full) 
         @event_type_cal_only_13 =  FactoryGirl.create(:cal_only) 
 
         end 
    
         it "val for date"  
     
         context "checking Event One comparasion" do

               it "not event one" do
               check = @event_type_full_event_12.for_event_one?
               check.should be_false   
               end
     
               it "for event one" do
               check = @event_type_ads_only_11.for_event_one?
               check.should be_true   
               end
     
               it "for event one" do
               check = @event_type_full_event_12.for_event_one?
               check.should be_false   
               end
     
               it "for event one" do
               check = @event_type_cal_only_13.for_event_one?
               check.should be_false   
               end
          end
      
     
         context "checking Event Two comparasion" do
       
               it "for event two"  do
               check = @event_type_full_event_12.for_event_two?
               check.should be_true   
               end
     
        end
    
        context "checking Event Three comparasion" do
     
         it "for event three" do
         check = @event_type_cal_only_13.for_event_three?
         check.should be_true   
         end 
     
       end
   
   
     
         it "is invalid without a Email" do  
              @event_type_full_event_12.should be_valid 
              @event_type_cal_only_13.should be_valid 
          
          end 
 
 
    
      end    
      
      describe "Checking String Limits" do
    
        it "is invalid Event Name with too many characters" do  
          FactoryGirl.build(:event_full, event_name: "fvsfvlsdfhbvlshjdfbvlshdfbvlhsdfvlhsdfhlvgsdflhvgsldhjfvlsdfhgvlshjdfgvlsjdhfgvlsjdhfgvlsdjhfgvlsdjhfvglsdfjhvglsfhsdflhvlsdfkjvhlsdfkjvhlsdfkjhvlskdjfhvlskjfhvlskdjfhvlsdkjfhvlsdkjfhvlsdkfjhvlskdfjhvlskjffvsfvlsdfhbvlshjdfbvlshdfbvlhsdfvlhsdfhlvgsdflhvgsldhjfvlsdfhgvlshjdfgvlsjdhfgvlsjdhfgvlsdjhfgvlsdjhfvglsdfjhvglsfhsdflhvlsdfkjvhlsdfkjvhlsdfkjhvlskdjfhvlskjfhvlskdjfhvlsdkjfhvlsdkjfhvlsdkfjhvlskdfjhvlskjfvsfvlsdfhbvlshjdfbvlshdfbvlhsdfvlhsdfhlvgsdflhvgsldhjfvlsdfhgvlshjdfgvlsjdhfgvlsjdhfgvlsdjhfgvlsdjhfvglsdfjhvglsfhsdflhvlsdfkjvhlsdfkjvhlsdfkjhvlskdjfhvlskjfhvlskdjfhvlsdkjfhvlsdkjfhvlsdkfjhvlskdfjhvlskjdhvlskjdfhvlkjsdfchid").should_not be_valid 
        end 
 
        it "is invalid Summary with too many characters" do  
          FactoryGirl.build(:event_full, summary: "fvsfvlsdfhbvlshjdfbvlshdfbvlhsdfvlhsdfhlvgsdflhvgsldhjfvlsdfhgvlshjdfgvlsjdhfgvlsjdhfgvlsdjhfgvlsdjhfvglsdfjhvglsfhsdflhvlsdfkjvhlsdfkjvhlsdfkjhvlskdjfhvlskjfhvlskdjfhvlsdkjfhvlsdkjfhvlsdkfjhvlskdfjhvlskjffvsfvlsdfhbvlshjdfbvlshdfbvlhsdfvlhsdfhlvgsdflhvgsldhjfvlsdfhgvlshjdfgvlsjdhfgvlsjdhfgvlsdjhfgvlsdjhfvglsdfjhvglsfhsdflhvlsdfkjvhlsdfkjvhlsdfkjhvlskdjfhvlskjfhvlskdjfhvlsdkjfhvlsdkjfhvlsdkfjhvlskdfjhvlskjfvsfvlsdfhbvlshjdfbvlshdfbvlhsdfvlhsdfhlvgsdflhvgsldhjfvlsdfhgvlshjdfgvlsjdhfgvlsjdhfgvlsdjhfgvlsdjhfvglsdfjhvglsfhsdflhvlsdfkjvhlsdfkjvhlsdfkjhvlskdjfhvlskjfhvlskdjfhvlsdkjfhvlsdkjfhvlsdkfjhvlskdfjhvlskjdhvlskjdfhvlkjsdfchid").should_not be_valid 
        end 
    
        it "is invalid contact_person with 41 - too many characters" do  
          FactoryGirl.build(:event_full, contact_person: "fvsfvlsdfhbvlshjfhvkjsdfchidfvsfvlsdfhbvv").should_not be_valid 
        end 

        it "is invalid Location with too many characters" do  
          FactoryGirl.build(:event_full, location: "fvsfvlsdfhbvlshjdfbvlshdfbvlhsdfvlhsdfhlvgsdflhvgsldhjfvlsdfhgvlshjdfgvlsjdhfgvlsjdhfgvlsdjhfgvlsdjhfvglsdfjhvglsfhsdflhvlsdfkjvhlsdfkjvhlsdfkjhvlskdjfhvlskjfhvlskdjfhvlsdkjfhvlsdkjfhvlsdkfjhvlskdfjhvlskjffvsfvlsdfhbvlshjdfbvlshdfbvlhsdfvlhsdfhlvgsdflhvgsldhjfvlsdfhgvlshjdfgvlsjdhfgvlsjdhfgvlsdjhfgvlsdjhfvglsdfjhvglsfhsdflhvlsdfkjvhlsdfkjvhlsdfkjhvlskdjfhvlskjfhvlskdjfhvlsdkjfhvlsdkjfhvlsdkfjhvlskdfjhvlskjfvsfvlsdfhbvlshjdfbvlshdfbvlhsdfvlhsdfhlvgsdflhvgsldhjfvlsdfhgvlshjdfgvlsjdhfgvlsjdhfgvlsdjhfgvlsdjhfvglsdfjhvglsfhsdflhvlsdfkjvhlsdfkjvhlsdfkjhvlskdjfhvlskjfhvlskdjfhvlsdkjfhvlsdkjfhvlsdkfjhvlskdfjhvlskjdhvlskjdfhvlkjsdfchid").should_not be_valid 
        end 
    
        it "is invalid download_link with too many characters" do  
          FactoryGirl.build(:event_full, download_link: "fvsfvlsdfhbvlshjdfbvlshdfbvlhsdfvlhsdfhlvgsdflhvgsldhjfvlsdfhgvlshjdfgvlsjdhfgvlsjdhfgvlsdjhfgvlsdjhfvglsdfjhvglsfhsdflhvlsdfkjvhlsdfkjvhlsdfkjhvlskdjfhvlskjfhvlskdjfhvlsdkjfhvlsdkjfhvlsdkfjhvlskdfjhvlskjffvsfvlsdfhbvlshjdfbvlshdfbvlhsdfvlhsdfhlvgsdflhvgsldhjfvlsdfhgvlshjdfgvlsjdhfgvlsjdhfgvlsdjhfgvlsdjhfvglsdfjhvglsfhsdflhvlsdfkjvhlsdfkjvhlsdfkjhvlskdjfhvlskjfhvlskdjfhvlsdkjfhvlsdkjfhvlsdkfjhvlskdfjhvlskjfvsfvlsdfhbvlshjdfbvlshdfbvlhsdfvlhsdfhlvgsdflhvgsldhjfvlsdfhgvlshjdfgvlsjdhfgvlsjdhfgvlsdjhfgvlsdjhfvglsdfjhvglsfhsdflhvlsdfkjvhlsdfkjvhlsdfkjhvlskdjfhvlskjfhvlskdjfhvlsdkjfhvlsdkjfhvlsdkfjhvlskdfjhvlskjdhvlskjdfhvlkjsdfchid").should_not be_valid 
        end 
    
        it "is invalid internal_link_urltoo many characters" do  
          FactoryGirl.build(:event_full, internal_link_url: "fvsfvlsdfhbvlshjfhvkjsdfchidfvsfvlsdfhbvfvlsdfhbvlshjfhvkjsdfchidfvsfvlsdfhbvfvlsdfhbvlshjfhvkjsdfchidfvsfvlsdfhbvv").should_not be_valid 
        end 

        it "is invalid Location with too many characters" do  
          FactoryGirl.build(:event_full, location:  "fvsfvlsdfhbvlshjfhvkjsdfchidfvsfvlsdfhbvv").should_not be_valid 
        end 
    
      end  
      
      
      
      
      
        
      
end
