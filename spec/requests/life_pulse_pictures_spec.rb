require 'spec_helper'

describe "LifePulsePictures" do
  describe "GET /life_pulse_pictures" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get life_pulse_pictures_path
      response.status.should be(200)
    end
  end
end
