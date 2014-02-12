require 'spec_helper'

describe ChurchStaff do


  it "is Factory is valid" do 
     FactoryGirl.build(:church_staff).should be_valid
  end 


end
