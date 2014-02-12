require 'spec_helper'
 
 
describe "ContactTech" do
   login_user
    
       it "User can email admin" do
        visit contact_tech_path
        fill_in "Name", :with => @user.name
        fill_in "Email", :with => @user.email 
        fill_in "Message", :with => "user.name"
        click_button "Send Message"
        current_path.should eq(root_path)
        page.should have_content("Your message was successfully sent.")
        last_email.to.should include ENV["ADMIN_EMAIL"]
   
      end  
  
end