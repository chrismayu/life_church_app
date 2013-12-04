require "spec_helper"

describe EventSetupFormsController do
  describe "routing" do

    it "routes to #index" do
      get("/event_setup_forms").should route_to("event_setup_forms#index")
    end

    it "routes to #new" do
      get("/event_setup_forms/new").should route_to("event_setup_forms#new")
    end

    it "routes to #show" do
      get("/event_setup_forms/1").should route_to("event_setup_forms#show", :id => "1")
    end

    it "routes to #edit" do
      get("/event_setup_forms/1/edit").should route_to("event_setup_forms#edit", :id => "1")
    end

    it "routes to #create" do
      post("/event_setup_forms").should route_to("event_setup_forms#create")
    end

    it "routes to #update" do
      put("/event_setup_forms/1").should route_to("event_setup_forms#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/event_setup_forms/1").should route_to("event_setup_forms#destroy", :id => "1")
    end

  end
end
