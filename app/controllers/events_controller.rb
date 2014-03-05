class EventsController < ApplicationController
  # GET /events
  # GET /events.json
  load_and_authorize_resource :except => [:index, :show ]
  
  before_filter :authenticate_user!, :except => [:index, :show ]
  
  before_filter :find_event, :only => [:show]
  
  def find_event
    @event = Event.find(params[:id])
    if request.path != event_path(@event)
       redirect_to @event, status: :moved_permanently
    end
  
  end
  
  def advertisment
    @events = Event.where("event_type = ?", 11)
    

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @events }
    end
  end
  
  def events
    @events = Event.where("event_type = ?", 12)
   

    respond_to do |format|
      format.html 
      format.json { render json: @events }
    end
  end
  
  def calendar_only
    
    @events = Event.where("event_type = ?", 13)
 

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @events }
    end
  end
  
  def index
    @service_times = ServiceTime.all
    @events = Event.where(Event.arel_table[:event_type].not_eq(11)) 
    @events_by_date = @events.group_by(&:event_date)
       @date = params[:date] ? Date.parse(params[:date]) : Date.today

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @events }
    end
  end
  
 
  

  # GET /events/1
  # GET /events/1.json
  def show
    
    # add redirect for ads and calendars - to their index pages  advertisment
    @event = Event.find(params[:id])
    
    if @event.event_type == 11
      redirect_to events_advertisment_path  
    else
     
      if @event.event_type == 13
        redirect_to events_calendar_only_path  
      else        
    
   

    respond_to do |format|
      format.html  
      format.json { render json: @event }
    end
   end # Calendar Only
   end # Advertisment
  
  end

  # GET /events/new
  # GET /events/new.json
  def new
    @event = Event.new(event_type: params[:event_type])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @event }
    end
  end

  # GET /events/1/edit
  def edit
    @event = Event.find(params[:id])
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(params[:event])


  # @event.event_type == 11  - redirect to picture setup    event_pictures_step_1_path(:event_id => @event.id)

 
    respond_to do |format|
      if @event.save
        if @event.event_type == 11
        format.html { redirect_to event_pictures_step_1_path(:event_id => @event.id), notice: 'Event was successfully created.' }
        else
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render json: @event, status: :created, location: @event }
      end
      
      else
        format.html { render action: "new" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /events/1
  # PUT /events/1.json
  def update
    @event = Event.find(params[:id])

    respond_to do |format|
      if @event.update_attributes(params[:event])
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    respond_to do |format|
      format.html { redirect_to events_url }
      format.json { head :no_content }
    end
  end
end
