require "spec_helper"

describe LifePulsesController do
  describe "routing" do

    it "routes to #index" do
      get("/life_pulses").should route_to("life_pulses#index")
    end

    it "routes to #new" do
      get("/life_pulses/new").should route_to("life_pulses#new")
    end

    it "routes to #show" do
      get("/life_pulses/1").should route_to("life_pulses#show", :id => "1")
    end

    it "routes to #edit" do
      get("/life_pulses/1/edit").should route_to("life_pulses#edit", :id => "1")
    end

    it "routes to #create" do
      post("/life_pulses").should route_to("life_pulses#create")
    end

    it "routes to #update" do
      put("/life_pulses/1").should route_to("life_pulses#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/life_pulses/1").should route_to("life_pulses#destroy", :id => "1")
    end

  end
end
