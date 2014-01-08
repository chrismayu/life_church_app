class LifePulsePicturesController < ApplicationController
  # GET /life_pulse_pictures
  # GET /life_pulse_pictures.json
  def index
    @life_pulse_pictures = LifePulsePicture.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @life_pulse_pictures }
    end
  end

  # GET /life_pulse_pictures/1
  # GET /life_pulse_pictures/1.json
  def show
    @life_pulse_picture = LifePulsePicture.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @life_pulse_picture }
    end
  end

  # GET /life_pulse_pictures/new
  # GET /life_pulse_pictures/new.json
  def new
    @life_pulse_picture = LifePulsePicture.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @life_pulse_picture }
    end
  end

  # GET /life_pulse_pictures/1/edit
  def edit
    @life_pulse_picture = LifePulsePicture.find(params[:id])
  end

  # POST /life_pulse_pictures
  # POST /life_pulse_pictures.json
  def create
    @life_pulse_picture = LifePulsePicture.new(params[:life_pulse_picture])

    respond_to do |format|
      if @life_pulse_picture.save
        format.html { redirect_to @life_pulse_picture, notice: 'Life pulse picture was successfully created.' }
        format.json { render json: @life_pulse_picture, status: :created, location: @life_pulse_picture }
      else
        format.html { render action: "new" }
        format.json { render json: @life_pulse_picture.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /life_pulse_pictures/1
  # PUT /life_pulse_pictures/1.json
  def update
    @life_pulse_picture = LifePulsePicture.find(params[:id])

    respond_to do |format|
      if @life_pulse_picture.update_attributes(params[:life_pulse_picture])
        format.html { redirect_to @life_pulse_picture, notice: 'Life pulse picture was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @life_pulse_picture.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /life_pulse_pictures/1
  # DELETE /life_pulse_pictures/1.json
  def destroy
    @life_pulse_picture = LifePulsePicture.find(params[:id])
    @life_pulse_picture.destroy

    respond_to do |format|
      format.html { redirect_to life_pulse_pictures_url }
      format.json { head :no_content }
    end
  end
end
