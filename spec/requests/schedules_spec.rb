require 'spec_helper'

describe "Schedules" do
  describe "GET /schedules" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get schedules_path
      response.status.should be(200)
    end
  end
  
  
  
  
  describe "User Access" do
   login_user
    
       it "User can not access schedule index" do
        visit schedule_path
        current_path.should eq(root_path)
        page.should have_content("Not")
end
       it "User can not access schedule index" do
        visit new_schedule_path
        current_path.should eq(root_path)
        page.should have_content("Not")
end

end

describe "Member" do
   login_member
context "Should have access to" do

       it " Index page " do
        visit schedule_path
        current_path.should eq(schedule_path)

end

       it " Show page " do
        visit schedule_path
        current_path.should eq(schedule_path)

end

context "Should NOT have access to" do

       it " New page " do
        visit schedule_path
        current_path.should eq(schedule_path)

end

       it " Show page " do
        visit schedule_path
        current_path.should eq(schedule_path)

end

end
