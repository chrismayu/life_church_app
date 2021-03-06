class EventSetupFormsController < ApplicationController
  # GET /event_setup_forms
  # GET /event_setup_forms.json
  load_and_authorize_resource 
  
  before_filter :authenticate_user! 
  def index
    @event_setup_forms = EventSetupForm.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @event_setup_forms }
    end
  end

  # GET /event_setup_forms/1
  # GET /event_setup_forms/1.json
  def show
    @event_setup_form = EventSetupForm.find(params[:id])

    @event = Event.where(:id =>  @event_setup_form.event_id).last 
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @event_setup_form }
    end
  end

  # GET /event_setup_forms/new
  # GET /event_setup_forms/new.json
  def new
    @event = Event.where(:id => params[:event_id]).last 
 
 
    @event_setup_form = EventSetupForm.new(:event_id => params[:event_id])
   
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @event_setup_form }
    end
  end

  # GET /event_setup_forms/1/edit
  def edit
    @event_setup_form = EventSetupForm.find(params[:id])
    
    @event = Event.where(:id =>  @event_setup_form.event_id).last 
  end

  # POST /event_setup_forms
  # POST /event_setup_forms.json
  def create
    @event_setup_form = EventSetupForm.new(params[:event_setup_form])

    respond_to do |format|
      if @event_setup_form.save
        format.html { redirect_to @event_setup_form, notice: 'A New Form was successfully created.' }
        format.json { render json: @event_setup_form, status: :created, location: @event_setup_form }
      else
        format.html { render action: "new" }
        format.json { render json: @event_setup_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /event_setup_forms/1
  # PUT /event_setup_forms/1.json
  def update
    @event_setup_form = EventSetupForm.find(params[:id])

    respond_to do |format|
      if @event_setup_form.update_attributes(params[:event_setup_form])
        format.html { redirect_to @event_setup_form, notice: 'Event setup form was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @event_setup_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /event_setup_forms/1
  # DELETE /event_setup_forms/1.json
  def destroy
    @event_setup_form = EventSetupForm.find(params[:id])
    @event_setup_form.destroy

    respond_to do |format|
      format.html { redirect_to event_setup_forms_url }
      format.json { head :no_content }
    end
  end
end
