require "spec_helper"

describe MinistryPictureChildrenController do
  describe "routing" do

    it "routes to #index" do
      get("/ministry_picture_children").should route_to("ministry_picture_children#index")
    end

    it "routes to #new" do
      get("/ministry_picture_children/new").should route_to("ministry_picture_children#new")
    end

    it "routes to #show" do
      get("/ministry_picture_children/1").should route_to("ministry_picture_children#show", :id => "1")
    end

    it "routes to #edit" do
      get("/ministry_picture_children/1/edit").should route_to("ministry_picture_children#edit", :id => "1")
    end

    it "routes to #create" do
      post("/ministry_picture_children").should route_to("ministry_picture_children#create")
    end

    it "routes to #update" do
      put("/ministry_picture_children/1").should route_to("ministry_picture_children#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/ministry_picture_children/1").should route_to("ministry_picture_children#destroy", :id => "1")
    end

  end
end
