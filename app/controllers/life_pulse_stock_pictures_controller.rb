class LifePulseStockPicturesController < ApplicationController
  
  load_and_authorize_resource  
  
  before_filter :authenticate_user! 
  
  
  # GET /life_pulse_stock_pictures
  # GET /life_pulse_stock_pictures.json
  def index
    @life_pulse_stock_pictures = LifePulseStockPicture.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @life_pulse_stock_pictures }
    end
  end

  # GET /life_pulse_stock_pictures/1
  # GET /life_pulse_stock_pictures/1.json
  def show
    @life_pulse_stock_picture = LifePulseStockPicture.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @life_pulse_stock_picture }
    end
  end

  def step_1
        @uploader = LifePulseStockPicture.new.life_pulse_stock_image
         @uploader.success_action_redirect = new_life_pulse_stock_picture_url 

   end


   
    # GET /life_pulse_stock_pictures/new
    # GET /life_pulse_stock_pictures/new.json
  def new
    @life_pulse_stock_picture = LifePulseStockPicture.new(key: params[:key])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @life_pulse_stock_picture }
    end
  end

  # GET /life_pulse_stock_pictures/1/edit
  def edit
    @life_pulse_stock_picture = LifePulseStockPicture.find(params[:id])
  end

  # POST /life_pulse_stock_pictures
  # POST /life_pulse_stock_pictures.json
  def create
    @life_pulse_stock_picture = LifePulseStockPicture.new(params[:life_pulse_stock_picture])

    respond_to do |format|
      if @life_pulse_stock_picture.save
        format.html { redirect_to @life_pulse_stock_picture, notice: 'Life pulse stock picture was successfully created.' }
        format.json { render json: @life_pulse_stock_picture, status: :created, location: @life_pulse_stock_picture }
      else
        format.html { render action: "new" }
        format.json { render json: @life_pulse_stock_picture.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /life_pulse_stock_pictures/1
  # PUT /life_pulse_stock_pictures/1.json
  def update
    @life_pulse_stock_picture = LifePulseStockPicture.find(params[:id])

    respond_to do |format|
      if @life_pulse_stock_picture.update_attributes(params[:life_pulse_stock_picture])
        format.html { redirect_to @life_pulse_stock_picture, notice: 'Life pulse stock picture was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @life_pulse_stock_picture.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /life_pulse_stock_pictures/1
  # DELETE /life_pulse_stock_pictures/1.json
  def destroy
    @life_pulse_stock_picture = LifePulseStockPicture.find(params[:id])
    @life_pulse_stock_picture.destroy

    respond_to do |format|
      format.html { redirect_to life_pulse_stock_pictures_url }
      format.json { head :no_content }
    end
  end
end
