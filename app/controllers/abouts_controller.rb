class AboutsController < ApplicationController
  load_and_authorize_resource :except => [:index, :home, :become_a_believer, :giving, :what_we_believe, :mission_method, :facility, :membership ]
  before_filter :authenticate_user!, :except => [:index, :home, :become_a_believer, :giving, :what_we_believe, :mission_method, :facility, :membership ]
 
  
  def home
    @today = DateTime.now.strftime("%Y-%m-%d")
    
     @events = Event.where(:display_main_page => true).where("remove_event_date >= ?", @today).sample(5).shuffle 
  
   
     @events_side = Event.where(:display_main_page => true).where("remove_event_date >= ?", @today).sample(3).shuffle.reverse 
     @abouts = About.last
    
  end
  
  def mission_method  
  
  end  
  
  def what_we_believe 
    
     @what_we_believes = WhatWeBelieve.all
  
  end
  
  def facility
    
  end
  
  def membership
    
  end
  
  def giving
    
  end
  
  def become_a_believer
    
  end
  
  
      def create
        @message = Message.new(params[:message])
 
        if @message.valid?
           ContactMailer.site_message(@message).deliver
          redirect_to(abouts_path, :notice => "Your message was successfully sent.")
        else
          flash.now.alert = "Please fill all fields."
          render :new
        end
      end
  
  
  def index
    @abouts = About.last
    @service_times = ServiceTime.all
    @message = Message.new
    abouts = About.last
     @json = abouts.to_gmaps4rails
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @abouts }
    end
  end

  # GET /abouts/1
  # GET /abouts/1.json
  def show
     authorize! :approve, current_user, :message => 'Sorry - Not authorized - Contact Jason Tucker if page needed.'
    @about = About.last
    abouts = About.last
     @jsons = About.last.to_gmaps4rails
    @json = About.all.to_gmaps4rails
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @about }
    end
  end

 
  # GET /abouts/1/edit
  def edit
    authorize! :approve, current_user, :message => 'Sorry - Not authorized - Contact Jason Tucker if page needed.'
   @about = About.last
    @about = About.find(params[:id])
  end

  

  # PUT /abouts/1
  # PUT /abouts/1.json
  def update
    authorize! :approve, current_user, :message => 'Sorry - Not authorized - Contact Jason Tucker if page needed.'
   @about = About.last
    @about = About.find(params[:id])

    respond_to do |format|
      if @about.update_attributes(params[:about])
        format.html { redirect_to @about, notice: 'General Info was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @about.errors, status: :unprocessable_entity }
      end
    end
  end

 
end
