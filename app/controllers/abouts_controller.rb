class AboutsController < ApplicationController
  # GET /abouts
  # GET /abouts.json
  
  before_filter :authenticate_user!, :except => [:index, :home]
  
  def home
     @events = Event.where(id: Event.pluck(:id).sample(3))
    
    
  end
  
  
  
  
      def contact
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
    @about = About.find(params[:id])
  end

  

  # PUT /abouts/1
  # PUT /abouts/1.json
  def update
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
