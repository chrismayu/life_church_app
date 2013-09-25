class ServiceTimesController < ApplicationController
  before_filter :authenticate_user! 
  
  
  # GET /service_times
  # GET /service_times.json
  def index
    @service_times = ServiceTime.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @service_times }
    end
  end

  # GET /service_times/1
  # GET /service_times/1.json
  def show
    @service_time = ServiceTime.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @service_time }
    end
  end

  # GET /service_times/new
  # GET /service_times/new.json
  def new
    @service_time = ServiceTime.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @service_time }
    end
  end

  # GET /service_times/1/edit
  def edit
    @service_time = ServiceTime.find(params[:id])
  end

  # POST /service_times
  # POST /service_times.json
  def create
    @service_time = ServiceTime.new(params[:service_time])

    respond_to do |format|
      if @service_time.save
        format.html { redirect_to @service_time, notice: 'Service time was successfully created.' }
        format.json { render json: @service_time, status: :created, location: @service_time }
      else
        format.html { render action: "new" }
        format.json { render json: @service_time.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /service_times/1
  # PUT /service_times/1.json
  def update
    @service_time = ServiceTime.find(params[:id])

    respond_to do |format|
      if @service_time.update_attributes(params[:service_time])
        format.html { redirect_to @service_time, notice: 'Service time was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @service_time.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /service_times/1
  # DELETE /service_times/1.json
  def destroy
    @service_time = ServiceTime.find(params[:id])
    @service_time.destroy

    respond_to do |format|
      format.html { redirect_to service_times_url }
      format.json { head :no_content }
    end
  end
end
