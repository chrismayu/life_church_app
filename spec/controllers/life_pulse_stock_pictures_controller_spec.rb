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

describe LifePulseStockPicturesController do

  # This should return the minimal set of attributes required to create a valid
  # LifePulseStockPicture. As you add validations to LifePulseStockPicture, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "life_pulse_id" => "1" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # LifePulseStockPicturesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all life_pulse_stock_pictures as @life_pulse_stock_pictures" do
      life_pulse_stock_picture = LifePulseStockPicture.create! valid_attributes
      get :index, {}, valid_session
      assigns(:life_pulse_stock_pictures).should eq([life_pulse_stock_picture])
    end
  end

  describe "GET show" do
    it "assigns the requested life_pulse_stock_picture as @life_pulse_stock_picture" do
      life_pulse_stock_picture = LifePulseStockPicture.create! valid_attributes
      get :show, {:id => life_pulse_stock_picture.to_param}, valid_session
      assigns(:life_pulse_stock_picture).should eq(life_pulse_stock_picture)
    end
  end

  describe "GET new" do
    it "assigns a new life_pulse_stock_picture as @life_pulse_stock_picture" do
      get :new, {}, valid_session
      assigns(:life_pulse_stock_picture).should be_a_new(LifePulseStockPicture)
    end
  end

  describe "GET edit" do
    it "assigns the requested life_pulse_stock_picture as @life_pulse_stock_picture" do
      life_pulse_stock_picture = LifePulseStockPicture.create! valid_attributes
      get :edit, {:id => life_pulse_stock_picture.to_param}, valid_session
      assigns(:life_pulse_stock_picture).should eq(life_pulse_stock_picture)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new LifePulseStockPicture" do
        expect {
          post :create, {:life_pulse_stock_picture => valid_attributes}, valid_session
        }.to change(LifePulseStockPicture, :count).by(1)
      end

      it "assigns a newly created life_pulse_stock_picture as @life_pulse_stock_picture" do
        post :create, {:life_pulse_stock_picture => valid_attributes}, valid_session
        assigns(:life_pulse_stock_picture).should be_a(LifePulseStockPicture)
        assigns(:life_pulse_stock_picture).should be_persisted
      end

      it "redirects to the created life_pulse_stock_picture" do
        post :create, {:life_pulse_stock_picture => valid_attributes}, valid_session
        response.should redirect_to(LifePulseStockPicture.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved life_pulse_stock_picture as @life_pulse_stock_picture" do
        # Trigger the behavior that occurs when invalid params are submitted
        LifePulseStockPicture.any_instance.stub(:save).and_return(false)
        post :create, {:life_pulse_stock_picture => { "life_pulse_id" => "invalid value" }}, valid_session
        assigns(:life_pulse_stock_picture).should be_a_new(LifePulseStockPicture)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        LifePulseStockPicture.any_instance.stub(:save).and_return(false)
        post :create, {:life_pulse_stock_picture => { "life_pulse_id" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested life_pulse_stock_picture" do
        life_pulse_stock_picture = LifePulseStockPicture.create! valid_attributes
        # Assuming there are no other life_pulse_stock_pictures in the database, this
        # specifies that the LifePulseStockPicture created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        LifePulseStockPicture.any_instance.should_receive(:update_attributes).with({ "life_pulse_id" => "1" })
        put :update, {:id => life_pulse_stock_picture.to_param, :life_pulse_stock_picture => { "life_pulse_id" => "1" }}, valid_session
      end

      it "assigns the requested life_pulse_stock_picture as @life_pulse_stock_picture" do
        life_pulse_stock_picture = LifePulseStockPicture.create! valid_attributes
        put :update, {:id => life_pulse_stock_picture.to_param, :life_pulse_stock_picture => valid_attributes}, valid_session
        assigns(:life_pulse_stock_picture).should eq(life_pulse_stock_picture)
      end

      it "redirects to the life_pulse_stock_picture" do
        life_pulse_stock_picture = LifePulseStockPicture.create! valid_attributes
        put :update, {:id => life_pulse_stock_picture.to_param, :life_pulse_stock_picture => valid_attributes}, valid_session
        response.should redirect_to(life_pulse_stock_picture)
      end
    end

    describe "with invalid params" do
      it "assigns the life_pulse_stock_picture as @life_pulse_stock_picture" do
        life_pulse_stock_picture = LifePulseStockPicture.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        LifePulseStockPicture.any_instance.stub(:save).and_return(false)
        put :update, {:id => life_pulse_stock_picture.to_param, :life_pulse_stock_picture => { "life_pulse_id" => "invalid value" }}, valid_session
        assigns(:life_pulse_stock_picture).should eq(life_pulse_stock_picture)
      end

      it "re-renders the 'edit' template" do
        life_pulse_stock_picture = LifePulseStockPicture.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        LifePulseStockPicture.any_instance.stub(:save).and_return(false)
        put :update, {:id => life_pulse_stock_picture.to_param, :life_pulse_stock_picture => { "life_pulse_id" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested life_pulse_stock_picture" do
      life_pulse_stock_picture = LifePulseStockPicture.create! valid_attributes
      expect {
        delete :destroy, {:id => life_pulse_stock_picture.to_param}, valid_session
      }.to change(LifePulseStockPicture, :count).by(-1)
    end

    it "redirects to the life_pulse_stock_pictures list" do
      life_pulse_stock_picture = LifePulseStockPicture.create! valid_attributes
      delete :destroy, {:id => life_pulse_stock_picture.to_param}, valid_session
      response.should redirect_to(life_pulse_stock_pictures_url)
    end
  end

end
