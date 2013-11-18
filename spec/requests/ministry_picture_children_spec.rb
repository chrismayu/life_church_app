require 'spec_helper'

describe "MinistryPictureChildren" do
  describe "GET /ministry_picture_children" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get ministry_picture_children_path
      response.status.should be(200)
    end
  end
end
