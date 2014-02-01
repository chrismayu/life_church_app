require 'spec_helper'
 
describe "Sermons" do
  
  
  
   
    
    it "has valid Sermon factory" do
      FactoryGirl.create(:sermon).should be_valid
    end
    
    context "check for validations" do
    
    it "is invalid without a Sermon Name" do
      FactoryGirl.build(:sermon, title:nil).should_not be_valid
    end
    
    it "is invalid without a Date of Sermon" do
      FactoryGirl.build(:sermon, date_of_sermon:nil).should_not be_valid
    end
    
    end
 
   
  
  
    context "check for member sign views" do
      
      
      before :each do
        FactoryGirl.create(:about) 
        FactoryGirl.create(:speaker,first_name: "Tom")  
        FactoryGirl.create(:sermon, title: "Great Times")  
        FactoryGirl.create(:sermon, title: "Heaven")  
        @sermon = FactoryGirl.create(:sermon)  
       end
  
  
    it "check if sermon is valid" do
      
      @sermon.should be_valid
    end
  
    
    
    describe "Sermons Page"  do
  
             
        it "Visit Sermon Page"  do
          visit sermons_path
          expect(page).to have_text("Sermons")
      end  
      
      it "has title Great Times" do
        visit sermons_path
        expect(page).to have_text("Great Times")
      end
      it "has title Heaven" do
        visit sermons_path
        expect(page).to have_text("Heaven")
      end
    
      it "has speaker name Tom" do
        visit sermons_path
       expect(page).to have_text("Tom")
      end
    
  end
  
  describe "User Not Signed in" do
    
    before :each do
      FactoryGirl.create(:about) 
      FactoryGirl.create(:speaker,first_name: "Tom") 
 
     end 
  
        context "Display Until - User not signed in"  do
   
          before :each do
 
           # FactoryGirl.create(:sermon, title: "Heaven", date_of_sermon: DateTime.now + 2.years)
            #FactoryGirl.create(:sermon, title: "Heaven_old", date_of_sermon: DateTime.now - 2.days)
            FactoryGirl.create(:sermon, title: "John", display_until: DateTime.now + 2.days)
            FactoryGirl.create(:sermon, title: "Heaven_old", display_until: DateTime.now - 2.days)
      
           end
  
                context "Checking for newer Sermon that actual date " do
 
 
                   it "has title Heaven" do
                     visit sermons_path
                     expect(page).to have_text("John")
                   end
 
                end
 
               context "Checking for Pass Sermon that is hidden "  do
 
                     it "No title Heaven old " do
                    visit sermons_path
                    expect(page).to_not have_text("Heaven_old")
                    end
   
  
                 end
  
  
          end
  
  
          context "Date of Sermon - User not signed in"  do
   
            before :each do
 
              FactoryGirl.create(:sermon, title: "Sam", date_of_sermon: DateTime.now + 2.days)
              FactoryGirl.create(:sermon, title: "Heaven_old", date_of_sermon: DateTime.now - 2.days)
              FactoryGirl.create(:sermon, title: "Peter")
              FactoryGirl.create(:sermon, title: "Matthew", members_only: true)
             end 
    
  
                     it "Not Showing Early then date sermons" do
                       visit sermons_path
                       expect(page).to_not have_text("Sam")
                     end
  
                       it "Show Old Sermons " do
                      visit sermons_path
                      expect(page).to have_text("Heaven_old")
                      end
  
  
                      it "No Members Only Sermons" do
                     visit sermons_path
                     expect(page).to_not have_text("Matthew")
                     end
                     
                     it "Non Members Only Sermons" do
                    visit sermons_path
                    expect(page).to have_text("Peter")
                    end
         

            end
        end
  
  
  
   describe "User Signed in", :focus => true do
    login_user
    
     before :each do 
       FactoryGirl.create(:speaker,first_name: "Tom") 
      end 
 
            context "Date of Sermon - User Signed in"  do
   
              before :each do
                FactoryGirl.create(:sermon, title: "Sam", date_of_sermon: DateTime.now + 2.days)
                FactoryGirl.create(:sermon, title: "Heaven_old", date_of_sermon: DateTime.now - 2.days)
                FactoryGirl.create(:sermon, title: "Peter")
                FactoryGirl.create(:sermon, title: "Matthew", members_only: true)
               end 
    
  
                       it "Not Showing Early then date sermons" do
                         visit sermons_path
                         expect(page).to_not have_text("Sam")
                       end
  
                         it "Show Old Sermons " do
                        visit sermons_path
                        expect(page).to have_text("Heaven_old")
                        end
  
  
                        it "Yes Members Only Sermons" do
                       visit sermons_path
                       expect(page).to have_text("Matthew")
                       end
                     
                       it "Non Members Only Sermons" do
                      visit sermons_path
                      expect(page).to have_text("Peter")
                      end
         

              end
  
        end
  
  
end
  
  
  
  
  
  
  
  
  
end
