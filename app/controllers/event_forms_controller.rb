class EventFormsController < ApplicationController
  # GET /event_forms
  # GET /event_forms.json
  load_and_authorize_resource :except => [:new, :create ]
  
  before_filter :authenticate_user!, :except => [:new, :create]
  def index
    @event_forms = EventForm.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @event_forms }
    end
  end

  # GET /event_forms/1
  # GET /event_forms/1.json
  def show
    @event_form = EventForm.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @event_form }
    end
  end

  # GET /event_forms/new
  # GET /event_forms/new.json
  def new
    @event_setup_form = EventSetupForm.where(:id => params[:event_setup_form_id]).last 
    @event = Event.where(:id => @event_setup_form.event_id).last 
    @event_form = EventForm.new(:event_setup_form_id => params[:event_setup_form_id])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @event_form }
    end
  end

  # GET /event_forms/1/edit
  def edit
    @event_form = EventForm.find(params[:id])
  end

  # POST /event_forms
  # POST /event_forms.json
  def create
    @event_form = EventForm.new(params[:event_form])
     event_form = EventForm.new(params[:event_form])
    @event_setup_form = EventSetupForm.where(:id => event_form.event_setup_form_id).last 
    @event = Event.where(:id => @event_setup_form.event_id).last 
    
    EventFormMailer.thank_you_we_have_received(@event,@event_form, @event_setup_form ).deliver
    EventFormMailer.new_form_submitted(@event,@event_form, @event_setup_form ).deliver
    
    respond_to do |format|
      if @event_form.save
        format.html { redirect_to event_path(@event.id), notice: 'Your Submission has been successfully - Thank You' }
        format.json { render json: @event_form, status: :created, location: @event_form }
      else
        format.html { render action: "new" }
        format.json { render json: @event_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /event_forms/1
  # PUT /event_forms/1.json
  def update
    @event_form = EventForm.find(params[:id])

    respond_to do |format|
      if @event_form.update_attributes(params[:event_form])
        format.html { redirect_to @event_form, notice: 'Event form was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @event_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /event_forms/1
  # DELETE /event_forms/1.json
  def destroy
    @event_form = EventForm.find(params[:id])
    @event_form.destroy

    respond_to do |format|
      format.html { redirect_to event_forms_url }
      format.json { head :no_content }
    end
  end
end
