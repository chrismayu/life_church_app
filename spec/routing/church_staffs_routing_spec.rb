require "spec_helper"

describe ChurchStaffsController do
  describe "routing" do

    it "routes to #index" do
      get("/church_staffs").should route_to("church_staffs#index")
    end

    it "routes to #new" do
      get("/church_staffs/new").should route_to("church_staffs#new")
    end

    it "routes to #show" do
      get("/church_staffs/1").should route_to("church_staffs#show", :id => "1")
    end

    it "routes to #edit" do
      get("/church_staffs/1/edit").should route_to("church_staffs#edit", :id => "1")
    end

    it "routes to #create" do
      post("/church_staffs").should route_to("church_staffs#create")
    end

    it "routes to #update" do
      put("/church_staffs/1").should route_to("church_staffs#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/church_staffs/1").should route_to("church_staffs#destroy", :id => "1")
    end

  end
end
