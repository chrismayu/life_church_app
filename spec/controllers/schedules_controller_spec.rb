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

describe SchedulesController do

  # This should return the minimal set of attributes required to create a valid
  # Schedule. As you add validations to Schedule, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "name" => "MyString" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # SchedulesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all schedules as @schedules" do
      schedule = Schedule.create! valid_attributes
      get :index, {}, valid_session
      assigns(:schedules).should eq([schedule])
    end
  end

  describe "GET show" do
    it "assigns the requested schedule as @schedule" do
      schedule = Schedule.create! valid_attributes
      get :show, {:id => schedule.to_param}, valid_session
      assigns(:schedule).should eq(schedule)
    end
  end

  describe "GET new" do
    it "assigns a new schedule as @schedule" do
      get :new, {}, valid_session
      assigns(:schedule).should be_a_new(Schedule)
    end
  end

  describe "GET edit" do
    it "assigns the requested schedule as @schedule" do
      schedule = Schedule.create! valid_attributes
      get :edit, {:id => schedule.to_param}, valid_session
      assigns(:schedule).should eq(schedule)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Schedule" do
        expect {
          post :create, {:schedule => valid_attributes}, valid_session
        }.to change(Schedule, :count).by(1)
      end

      it "assigns a newly created schedule as @schedule" do
        post :create, {:schedule => valid_attributes}, valid_session
        assigns(:schedule).should be_a(Schedule)
        assigns(:schedule).should be_persisted
      end

      it "redirects to the created schedule" do
        post :create, {:schedule => valid_attributes}, valid_session
        response.should redirect_to(Schedule.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved schedule as @schedule" do
        # Trigger the behavior that occurs when invalid params are submitted
        Schedule.any_instance.stub(:save).and_return(false)
        post :create, {:schedule => { "name" => "invalid value" }}, valid_session
        assigns(:schedule).should be_a_new(Schedule)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Schedule.any_instance.stub(:save).and_return(false)
        post :create, {:schedule => { "name" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested schedule" do
        schedule = Schedule.create! valid_attributes
        # Assuming there are no other schedules in the database, this
        # specifies that the Schedule created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Schedule.any_instance.should_receive(:update_attributes).with({ "name" => "MyString" })
        put :update, {:id => schedule.to_param, :schedule => { "name" => "MyString" }}, valid_session
      end

      it "assigns the requested schedule as @schedule" do
        schedule = Schedule.create! valid_attributes
        put :update, {:id => schedule.to_param, :schedule => valid_attributes}, valid_session
        assigns(:schedule).should eq(schedule)
      end

      it "redirects to the schedule" do
        schedule = Schedule.create! valid_attributes
        put :update, {:id => schedule.to_param, :schedule => valid_attributes}, valid_session
        response.should redirect_to(schedule)
      end
    end

    describe "with invalid params" do
      it "assigns the schedule as @schedule" do
        schedule = Schedule.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Schedule.any_instance.stub(:save).and_return(false)
        put :update, {:id => schedule.to_param, :schedule => { "name" => "invalid value" }}, valid_session
        assigns(:schedule).should eq(schedule)
      end

      it "re-renders the 'edit' template" do
        schedule = Schedule.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Schedule.any_instance.stub(:save).and_return(false)
        put :update, {:id => schedule.to_param, :schedule => { "name" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested schedule" do
      schedule = Schedule.create! valid_attributes
      expect {
        delete :destroy, {:id => schedule.to_param}, valid_session
      }.to change(Schedule, :count).by(-1)
    end

    it "redirects to the schedules list" do
      schedule = Schedule.create! valid_attributes
      delete :destroy, {:id => schedule.to_param}, valid_session
      response.should redirect_to(schedules_url)
    end
  end

end
