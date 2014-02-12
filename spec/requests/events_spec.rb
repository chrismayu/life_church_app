require 'spec_helper'

describe "Events", :focus=>true  do
  describe "GET /events" do
  
 
      before(:each) do
       # @request.env["devise.mapping"] = Devise.mappings[:admin]
        @user = FactoryGirl.create(:admin) # Using factory girl as an example
         
        #@user.approved = true
        #put @user 
         #post_via_redirect user_session_path, 'user[email]' => @user.email, 'user[password]' => @user.password
      
      
      end
      
  
    
        it "Admin can add new event" do
         visit new_user_session_path
         fill_in "Email", :with => @user.email 
         fill_in "Password", :with => @user.password
         click_button "Login"
         current_path.should eq(new_user_session_path)
         page.should have_content("Signed in successfully - Welcome Back!")
    
   
       end  
  
    
    
  end
end
