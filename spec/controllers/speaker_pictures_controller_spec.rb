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

describe SpeakerPicturesController do

  # This should return the minimal set of attributes required to create a valid
  # SpeakerPicture. As you add validations to SpeakerPicture, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "speaker_image" => "MyString" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # SpeakerPicturesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all speaker_pictures as @speaker_pictures" do
      speaker_picture = SpeakerPicture.create! valid_attributes
      get :index, {}, valid_session
      assigns(:speaker_pictures).should eq([speaker_picture])
    end
  end

  describe "GET show" do
    it "assigns the requested speaker_picture as @speaker_picture" do
      speaker_picture = SpeakerPicture.create! valid_attributes
      get :show, {:id => speaker_picture.to_param}, valid_session
      assigns(:speaker_picture).should eq(speaker_picture)
    end
  end

  describe "GET new" do
    it "assigns a new speaker_picture as @speaker_picture" do
      get :new, {}, valid_session
      assigns(:speaker_picture).should be_a_new(SpeakerPicture)
    end
  end

  describe "GET edit" do
    it "assigns the requested speaker_picture as @speaker_picture" do
      speaker_picture = SpeakerPicture.create! valid_attributes
      get :edit, {:id => speaker_picture.to_param}, valid_session
      assigns(:speaker_picture).should eq(speaker_picture)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new SpeakerPicture" do
        expect {
          post :create, {:speaker_picture => valid_attributes}, valid_session
        }.to change(SpeakerPicture, :count).by(1)
      end

      it "assigns a newly created speaker_picture as @speaker_picture" do
        post :create, {:speaker_picture => valid_attributes}, valid_session
        assigns(:speaker_picture).should be_a(SpeakerPicture)
        assigns(:speaker_picture).should be_persisted
      end

      it "redirects to the created speaker_picture" do
        post :create, {:speaker_picture => valid_attributes}, valid_session
        response.should redirect_to(SpeakerPicture.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved speaker_picture as @speaker_picture" do
        # Trigger the behavior that occurs when invalid params are submitted
        SpeakerPicture.any_instance.stub(:save).and_return(false)
        post :create, {:speaker_picture => { "speaker_image" => "invalid value" }}, valid_session
        assigns(:speaker_picture).should be_a_new(SpeakerPicture)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        SpeakerPicture.any_instance.stub(:save).and_return(false)
        post :create, {:speaker_picture => { "speaker_image" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested speaker_picture" do
        speaker_picture = SpeakerPicture.create! valid_attributes
        # Assuming there are no other speaker_pictures in the database, this
        # specifies that the SpeakerPicture created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        SpeakerPicture.any_instance.should_receive(:update_attributes).with({ "speaker_image" => "MyString" })
        put :update, {:id => speaker_picture.to_param, :speaker_picture => { "speaker_image" => "MyString" }}, valid_session
      end

      it "assigns the requested speaker_picture as @speaker_picture" do
        speaker_picture = SpeakerPicture.create! valid_attributes
        put :update, {:id => speaker_picture.to_param, :speaker_picture => valid_attributes}, valid_session
        assigns(:speaker_picture).should eq(speaker_picture)
      end

      it "redirects to the speaker_picture" do
        speaker_picture = SpeakerPicture.create! valid_attributes
        put :update, {:id => speaker_picture.to_param, :speaker_picture => valid_attributes}, valid_session
        response.should redirect_to(speaker_picture)
      end
    end

    describe "with invalid params" do
      it "assigns the speaker_picture as @speaker_picture" do
        speaker_picture = SpeakerPicture.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        SpeakerPicture.any_instance.stub(:save).and_return(false)
        put :update, {:id => speaker_picture.to_param, :speaker_picture => { "speaker_image" => "invalid value" }}, valid_session
        assigns(:speaker_picture).should eq(speaker_picture)
      end

      it "re-renders the 'edit' template" do
        speaker_picture = SpeakerPicture.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        SpeakerPicture.any_instance.stub(:save).and_return(false)
        put :update, {:id => speaker_picture.to_param, :speaker_picture => { "speaker_image" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested speaker_picture" do
      speaker_picture = SpeakerPicture.create! valid_attributes
      expect {
        delete :destroy, {:id => speaker_picture.to_param}, valid_session
      }.to change(SpeakerPicture, :count).by(-1)
    end

    it "redirects to the speaker_pictures list" do
      speaker_picture = SpeakerPicture.create! valid_attributes
      delete :destroy, {:id => speaker_picture.to_param}, valid_session
      response.should redirect_to(speaker_pictures_url)
    end
  end

end
