class EventPicturesController < ApplicationController
  # GET /event_pictures
  # GET /event_pictures.json
  load_and_authorize_resource  
  
  before_filter :authenticate_user! 
  
  
  def index
    @event_pictures = EventPicture.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @event_pictures }
    end
  end

  # GET /event_pictures/1
  # GET /event_pictures/1.json
  def show
    @event_picture = EventPicture.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @event_picture }
    end
  end

 def step_1
      @uploader = EventPicture.new.event_image
       @uploader.success_action_redirect = event_pictures_step_2_url(:event_id => params[:event_id])
  
   
   
   
 end


  def step_2
    
     @event_picture = EventPicture.new(key: params[:key], event_id: params[:event_id])
    
    respond_to do |format|
      if @event_picture.save
       #  format.html { redirect_to @event_picture, notice: 'Event picture was successfully created.' }
         #format.html { redirect_to @event_picture, notice: 'Event picture was successfully created.' }
        
       format.html { redirect_to event_path(@event_picture.event_id), notice: 'This Event picture was successfully created.' }
        # format.html { redirect_to events_path, notice: 'This Event picture was successfully created.' }
       
        else
          format.html { render action: "step_1" }
          format.json { render json: @event_picture.errors, status: :unprocessable_entity }
        end
    end

  end

  # GET /event_pictures/new
  # GET /event_pictures/new.json
  def new
    @event_picture = EventPicture.new(key: params[:key])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @event_picture }
    end
  end

  # GET /event_pictures/1/edit
  def edit
    @event_picture = EventPicture.find(params[:id])
  end

  # POST /event_pictures
  # POST /event_pictures.json
  def create
    @event_picture = EventPicture.new(params[:event_picture])

    respond_to do |format|
      if @event_picture.save
        format.html { redirect_to @event_picture, notice: 'Event picture was successfully created.' }
        format.json { render json: @event_picture, status: :created, location: @event_picture }
      else
        format.html { render action: "new" }
        format.json { render json: @event_picture.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /event_pictures/1
  # PUT /event_pictures/1.json
  def update
    @event_picture = EventPicture.find(params[:id])

    respond_to do |format|
      if @event_picture.update_attributes(params[:event_picture])
        format.html { redirect_to @event_picture, notice: 'Event picture was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @event_picture.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /event_pictures/1
  # DELETE /event_pictures/1.json
  def destroy
    @event_picture = EventPicture.find(params[:id])
    redirect_id = @event_picture.event_id
    @event_picture.destroy

    respond_to do |format|
      format.html { redirect_to event_path(redirect_id), notice: 'Event picture has been removed.'  }
      format.json { head :no_content }
    end
  end
end
