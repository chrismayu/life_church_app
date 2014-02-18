require 'spec_helper'
include Warden::Test::Helpers

describe "Schedules" do
  
  describe "Volunteer" do
     login_volunteer
 
         context "Should have access to" do

            it " Index page " do
             visit schedules_path
             current_path.should eq(schedules_path) 
            end

             it " Show page " do
             visit schedules_path
             current_path.should eq(schedules_path)
             
            end
            
            it " New page " do
             visit new_schedule_path
             current_path.should_not eq(new_schedule_path)
             current_path.should eq(root_path)  
            end

             it " Show page " do
             visit schedules_path
            current_path.should eq(schedules_path) 
             
            end 
          end 
      end
 
        describe "Member" do
     
        login_member
        
               context "Should NOT have access to" do

                  it " Index page " do
                   visit schedules_path
                   current_path.should_not eq(schedules_path)
                   current_path.should eq(root_path)  
                  end

                   it " Show page " do
                   visit schedules_path
                   current_path.should_not eq(schedules_path)
                   current_path.should eq(root_path)
                   
                  end
                  
                  it " Index page " do
                   visit new_schedule_path
                   current_path.should_not eq(schedules_path)
                   current_path.should eq(root_path)  
                  end

                   it " Show page " do
                   visit schedules_path
                   current_path.should_not eq(schedules_path)
                   current_path.should eq(root_path)
                   
                  end 
                end 
            end
  
  end