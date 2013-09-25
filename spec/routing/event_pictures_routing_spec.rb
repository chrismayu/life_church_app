require "spec_helper"

describe EventPicturesController do
  describe "routing" do

    it "routes to #index" do
      get("/event_pictures").should route_to("event_pictures#index")
    end

    it "routes to #new" do
      get("/event_pictures/new").should route_to("event_pictures#new")
    end

    it "routes to #show" do
      get("/event_pictures/1").should route_to("event_pictures#show", :id => "1")
    end

    it "routes to #edit" do
      get("/event_pictures/1/edit").should route_to("event_pictures#edit", :id => "1")
    end

    it "routes to #create" do
      post("/event_pictures").should route_to("event_pictures#create")
    end

    it "routes to #update" do
      put("/event_pictures/1").should route_to("event_pictures#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/event_pictures/1").should route_to("event_pictures#destroy", :id => "1")
    end

  end
end
