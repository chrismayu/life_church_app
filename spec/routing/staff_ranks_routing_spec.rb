require "spec_helper"

describe StaffRanksController do
  describe "routing" do

    it "routes to #index" do
      get("/staff_ranks").should route_to("staff_ranks#index")
    end

    it "routes to #new" do
      get("/staff_ranks/new").should route_to("staff_ranks#new")
    end

    it "routes to #show" do
      get("/staff_ranks/1").should route_to("staff_ranks#show", :id => "1")
    end

    it "routes to #edit" do
      get("/staff_ranks/1/edit").should route_to("staff_ranks#edit", :id => "1")
    end

    it "routes to #create" do
      post("/staff_ranks").should route_to("staff_ranks#create")
    end

    it "routes to #update" do
      put("/staff_ranks/1").should route_to("staff_ranks#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/staff_ranks/1").should route_to("staff_ranks#destroy", :id => "1")
    end

  end
end
