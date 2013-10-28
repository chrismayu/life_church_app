require "spec_helper"

describe MinistryPicturesController do
  describe "routing" do

    it "routes to #index" do
      get("/ministry_pictures").should route_to("ministry_pictures#index")
    end

    it "routes to #new" do
      get("/ministry_pictures/new").should route_to("ministry_pictures#new")
    end

    it "routes to #show" do
      get("/ministry_pictures/1").should route_to("ministry_pictures#show", :id => "1")
    end

    it "routes to #edit" do
      get("/ministry_pictures/1/edit").should route_to("ministry_pictures#edit", :id => "1")
    end

    it "routes to #create" do
      post("/ministry_pictures").should route_to("ministry_pictures#create")
    end

    it "routes to #update" do
      put("/ministry_pictures/1").should route_to("ministry_pictures#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/ministry_pictures/1").should route_to("ministry_pictures#destroy", :id => "1")
    end

  end
end
