require "spec_helper"

describe EgivingsController do
  describe "routing" do

    it "routes to #index" do
      get("/egivings").should route_to("egivings#index")
    end

    it "routes to #new" do
      get("/egivings/new").should route_to("egivings#new")
    end

    it "routes to #show" do
      get("/egivings/1").should route_to("egivings#show", :id => "1")
    end

    it "routes to #edit" do
      get("/egivings/1/edit").should route_to("egivings#edit", :id => "1")
    end

    it "routes to #create" do
      post("/egivings").should route_to("egivings#create")
    end

    it "routes to #update" do
      put("/egivings/1").should route_to("egivings#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/egivings/1").should route_to("egivings#destroy", :id => "1")
    end

  end
end
