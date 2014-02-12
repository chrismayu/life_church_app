require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe SermonsController do

  # This should return the minimal set of attributes required to create a valid
  # Sermon. As you add validations to Sermon, be sure to
  # adjust the attributes here as well.
  #before :each do
  let(:valid_attributes) {  FactoryGirl.create(:sermon)  }

   # FactoryGirl.create(:sermon)
  # end 
   
   before :each do
     FactoryGirl.create(:about) 
     FactoryGirl.create(:speaker,first_name: "Tom")  
    end 

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # SermonsController. Be sure to keep this updated too.
  let(:valid_session) { {} }
 
  describe "GET index" do
    it "assigns all sermons as @sermons" do
      sermon = FactoryGirl.create(:sermon)
      get :index, {}, valid_session
      assigns(:sermons).should eq([sermon])
    end
  end

  describe "GET show" do
    it "assigns the requested sermon as @sermon" do
      sermon = FactoryGirl.create(:sermon)
      get :show, {:id => sermon.to_param}, valid_session
      assigns(:sermon).should eq(sermon)
    end
  end

  describe "GET new" do
    it "assigns a new sermon as @sermon" do
      get :new, {}, valid_session
      assigns(:sermon).should be_a_new(Sermon)
    end
  end

  describe "GET edit" do
    it "assigns the requested sermon as @sermon" do
      sermon = FactoryGirl.create(:sermon)
      get :edit, {:id => sermon.to_param}, valid_session
      assigns(:sermon).should eq(sermon)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Sermon" do
        expect {
          post :create, {:sermon => FactoryGirl.build(:sermon)}, valid_session
        }.to change(Sermon, :count).by(1)
      end

      it "assigns a newly created sermon as @sermon" do
        post :create, {:sermon => valid_attributes}, valid_session
        assigns(:sermon).should be_a(Sermon)
        assigns(:sermon).should be_persisted
      end

      it "redirects to the created sermon" do
        post :create, {:sermon => valid_attributes}, valid_session
        response.should redirect_to(Sermon.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved sermon as @sermon" do
        # Trigger the behavior that occurs when invalid params are submitted
        Sermon.any_instance.stub(:save).and_return(false)
        post :create, {:sermon => { "date_of_sermon" => "invalid value" }}, valid_session
        assigns(:sermon).should be_a_new(Sermon)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Sermon.any_instance.stub(:save).and_return(false)
        post :create, {:sermon => { "date_of_sermon" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested sermon" do
        sermon = FactoryGirl.create(:sermon)
        # Assuming there are no other sermons in the database, this
        # specifies that the Sermon created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Sermon.any_instance.should_receive(:update_attributes).with({ "date_of_sermon" => "2013-10-22" })
        put :update, {:id => sermon.to_param, :sermon => { "date_of_sermon" => "2013-10-22" }}, valid_session
      end

      it "assigns the requested sermon as @sermon" do
        sermon = FactoryGirl.create(:sermon)
        put :update, {:id => sermon.to_param, :sermon => FactoryGirl.build(:sermon)}, valid_session
        assigns(:sermon).should eq(sermon)
      end

      it "redirects to the sermon" do
        sermon = FactoryGirl.create(:sermon)
        put :update, {:id => sermon.to_param, :sermon => FactoryGirl.build(:sermon)}, valid_session
        response.should redirect_to(sermon)
      end
    end

    describe "with invalid params" do
      it "assigns the sermon as @sermon" do
        sermon = FactoryGirl.create(:sermon)
        # Trigger the behavior that occurs when invalid params are submitted
        Sermon.any_instance.stub(:save).and_return(false)
        put :update, {:id => sermon.to_param, :sermon => { "date_of_sermon" => "invalid value" }}, valid_session
        assigns(:sermon).should eq(sermon)
      end

      it "re-renders the 'edit' template" do
        sermon = FactoryGirl.create(:sermon)
        # Trigger the behavior that occurs when invalid params are submitted
        Sermon.any_instance.stub(:save).and_return(false)
        put :update, {:id => sermon.to_param, :sermon => { "date_of_sermon" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested sermon" do
      sermon = FactoryGirl.create(:sermon)
      expect {
        delete :destroy, {:id => sermon.to_param}, valid_session
      }.to change(Sermon, :count).by(-1)
    end

    it "redirects to the sermons list" do
      sermon = FactoryGirl.create(:sermon)
      delete :destroy, {:id => sermon.to_param}, valid_session
      response.should redirect_to(sermons_url)
    end
  end

end
