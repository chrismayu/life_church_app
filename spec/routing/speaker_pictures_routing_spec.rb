require "spec_helper"

describe SpeakerPicturesController do
  describe "routing" do

    it "routes to #index" do
      get("/speaker_pictures").should route_to("speaker_pictures#index")
    end

    it "routes to #new" do
      get("/speaker_pictures/new").should route_to("speaker_pictures#new")
    end

    it "routes to #show" do
      get("/speaker_pictures/1").should route_to("speaker_pictures#show", :id => "1")
    end

    it "routes to #edit" do
      get("/speaker_pictures/1/edit").should route_to("speaker_pictures#edit", :id => "1")
    end

    it "routes to #create" do
      post("/speaker_pictures").should route_to("speaker_pictures#create")
    end

    it "routes to #update" do
      put("/speaker_pictures/1").should route_to("speaker_pictures#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/speaker_pictures/1").should route_to("speaker_pictures#destroy", :id => "1")
    end

  end
end
