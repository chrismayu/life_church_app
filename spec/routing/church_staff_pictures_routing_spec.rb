require "spec_helper"

describe ChurchStaffPicturesController do
  describe "routing" do

    it "routes to #index" do
      get("/church_staff_pictures").should route_to("church_staff_pictures#index")
    end

    it "routes to #new" do
      get("/church_staff_pictures/new").should route_to("church_staff_pictures#new")
    end

    it "routes to #show" do
      get("/church_staff_pictures/1").should route_to("church_staff_pictures#show", :id => "1")
    end

    it "routes to #edit" do
      get("/church_staff_pictures/1/edit").should route_to("church_staff_pictures#edit", :id => "1")
    end

    it "routes to #create" do
      post("/church_staff_pictures").should route_to("church_staff_pictures#create")
    end

    it "routes to #update" do
      put("/church_staff_pictures/1").should route_to("church_staff_pictures#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/church_staff_pictures/1").should route_to("church_staff_pictures#destroy", :id => "1")
    end

  end
end
