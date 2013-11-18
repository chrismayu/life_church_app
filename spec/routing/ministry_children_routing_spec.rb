require "spec_helper"

describe MinistryChildrenController do
  describe "routing" do

    it "routes to #index" do
      get("/ministry_children").should route_to("ministry_children#index")
    end

    it "routes to #new" do
      get("/ministry_children/new").should route_to("ministry_children#new")
    end

    it "routes to #show" do
      get("/ministry_children/1").should route_to("ministry_children#show", :id => "1")
    end

    it "routes to #edit" do
      get("/ministry_children/1/edit").should route_to("ministry_children#edit", :id => "1")
    end

    it "routes to #create" do
      post("/ministry_children").should route_to("ministry_children#create")
    end

    it "routes to #update" do
      put("/ministry_children/1").should route_to("ministry_children#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/ministry_children/1").should route_to("ministry_children#destroy", :id => "1")
    end

  end
end
