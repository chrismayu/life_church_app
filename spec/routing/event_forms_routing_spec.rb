require "spec_helper"

describe EventFormsController do
  describe "routing" do

    it "routes to #index" do
      get("/event_forms").should route_to("event_forms#index")
    end

    it "routes to #new" do
      get("/event_forms/new").should route_to("event_forms#new")
    end

    it "routes to #show" do
      get("/event_forms/1").should route_to("event_forms#show", :id => "1")
    end

    it "routes to #edit" do
      get("/event_forms/1/edit").should route_to("event_forms#edit", :id => "1")
    end

    it "routes to #create" do
      post("/event_forms").should route_to("event_forms#create")
    end

    it "routes to #update" do
      put("/event_forms/1").should route_to("event_forms#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/event_forms/1").should route_to("event_forms#destroy", :id => "1")
    end

  end
end
