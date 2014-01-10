class LifePulsesController < ApplicationController
  
  load_and_authorize_resource :except => [:show, :index ]
  
  before_filter :authenticate_user!, :except => [:show, :index ]
 
  
  
  before_filter :find_life_pulse, :only => [:show]
  
  def find_life_pulse
    @life_pulse = LifePulse.find(params[:id])
    if request.path != life_pulse_path(@life_pulse)
      redirect_to @life_pulse, status: :moved_permanently
     end
    
  end
  
  def index
    @life_pulses = LifePulse.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @life_pulses }
    end
  end

  # GET /life_pulses/1
  # GET /life_pulses/1.json
  def show
    @life_pulse = LifePulse.find(params[:id])
  
    if @life_pulse.template_selected == 1 
       template = "template1"
    elsif @life_pulse.template_selected == 2
       template = "template2"
    else
      template = "show"
    end

    respond_to do |format|
      format.html {render template }
      format.json { render json: @life_pulse }
    end
  end

  # GET /life_pulses/new
  # GET /life_pulses/new.json
  def new
    @life_pulse = LifePulse.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @life_pulse }
    end
  end

  # GET /life_pulses/1/edit
  def edit
    @life_pulse = LifePulse.find(params[:id])
  end

  # POST /life_pulses
  # POST /life_pulses.json
  def create
    @life_pulse = LifePulse.new(params[:life_pulse])

    respond_to do |format|
      if @life_pulse.save
        format.html { redirect_to @life_pulse, notice: 'Life pulse was successfully created.' }
        format.json { render json: @life_pulse, status: :created, location: @life_pulse }
      else
        format.html { render action: "new" }
        format.json { render json: @life_pulse.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /life_pulses/1
  # PUT /life_pulses/1.json
  def update
    @life_pulse = LifePulse.find(params[:id])

    respond_to do |format|
      if @life_pulse.update_attributes(params[:life_pulse])
        format.html { redirect_to @life_pulse, notice: 'Life pulse was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @life_pulse.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /life_pulses/1
  # DELETE /life_pulses/1.json
  def destroy
    @life_pulse = LifePulse.find(params[:id])
    @life_pulse.destroy

    respond_to do |format|
      format.html { redirect_to life_pulses_url }
      format.json { head :no_content }
    end
  end
end
