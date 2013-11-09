require 'spec_helper'

describe "MinistryChildren" do
  describe "GET /ministry_children" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get ministry_children_path
      response.status.should be(200)
    end
  end
end
