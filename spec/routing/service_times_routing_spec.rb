require "spec_helper"

describe ServiceTimesController do
  describe "routing" do

    it "routes to #index" do
      get("/service_times").should route_to("service_times#index")
    end

    it "routes to #new" do
      get("/service_times/new").should route_to("service_times#new")
    end

    it "routes to #show" do
      get("/service_times/1").should route_to("service_times#show", :id => "1")
    end

    it "routes to #edit" do
      get("/service_times/1/edit").should route_to("service_times#edit", :id => "1")
    end

    it "routes to #create" do
      post("/service_times").should route_to("service_times#create")
    end

    it "routes to #update" do
      put("/service_times/1").should route_to("service_times#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/service_times/1").should route_to("service_times#destroy", :id => "1")
    end

  end
end
