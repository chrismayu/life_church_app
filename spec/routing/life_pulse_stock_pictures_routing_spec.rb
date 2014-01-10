require "spec_helper"

describe LifePulseStockPicturesController do
  describe "routing" do

    it "routes to #index" do
      get("/life_pulse_stock_pictures").should route_to("life_pulse_stock_pictures#index")
    end

    it "routes to #new" do
      get("/life_pulse_stock_pictures/new").should route_to("life_pulse_stock_pictures#new")
    end

    it "routes to #show" do
      get("/life_pulse_stock_pictures/1").should route_to("life_pulse_stock_pictures#show", :id => "1")
    end

    it "routes to #edit" do
      get("/life_pulse_stock_pictures/1/edit").should route_to("life_pulse_stock_pictures#edit", :id => "1")
    end

    it "routes to #create" do
      post("/life_pulse_stock_pictures").should route_to("life_pulse_stock_pictures#create")
    end

    it "routes to #update" do
      put("/life_pulse_stock_pictures/1").should route_to("life_pulse_stock_pictures#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/life_pulse_stock_pictures/1").should route_to("life_pulse_stock_pictures#destroy", :id => "1")
    end

  end
end
