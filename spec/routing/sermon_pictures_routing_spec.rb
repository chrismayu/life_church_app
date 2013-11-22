require "spec_helper"

describe SermonPicturesController do
  describe "routing" do

    it "routes to #index" do
      get("/sermon_pictures").should route_to("sermon_pictures#index")
    end

    it "routes to #new" do
      get("/sermon_pictures/new").should route_to("sermon_pictures#new")
    end

    it "routes to #show" do
      get("/sermon_pictures/1").should route_to("sermon_pictures#show", :id => "1")
    end

    it "routes to #edit" do
      get("/sermon_pictures/1/edit").should route_to("sermon_pictures#edit", :id => "1")
    end

    it "routes to #create" do
      post("/sermon_pictures").should route_to("sermon_pictures#create")
    end

    it "routes to #update" do
      put("/sermon_pictures/1").should route_to("sermon_pictures#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/sermon_pictures/1").should route_to("sermon_pictures#destroy", :id => "1")
    end

  end
end
