class LifePulsePicturesController < ApplicationController
  # GET /life_pulse_pictures
  # GET /life_pulse_pictures.json
  
  load_and_authorize_resource  
  
  before_filter :authenticate_user! 
  
  
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



  def step_1
        @uploader = LifePulsePicture.new.life_pulse_image
         @uploader.success_action_redirect = life_pulse_pictures_step_2_url(:life_pulse_id => params[:life_pulse_id])

   end


    def step_2

       @life_pulse_picture = LifePulsePicture.new(key: params[:key], life_pulse_id: params[:life_pulse_id])

      respond_to do |format|
        if @life_pulse_picture.save
 
         format.html { redirect_to life_pulse_path(@life_pulse_picture.life_pulse_id), notice: 'This life_pulse picture was successfully created.' }
         
          else
            format.html { render action: "step_1" }
            format.json { render json: @life_pulse_picture.errors, status: :unprocessable_entity }
          end
      end

    end

    # GET /life_pulse_pictures/new
    # GET /life_pulse_pictures/new.json
  def new
    @life_pulse_picture = LifePulsePicture.new(key: params[:key])

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
    redirect_id = @life_pulse_picture.life_pulse_id
    @life_pulse_picture.destroy


    respond_to do |format|
      format.html { redirect_to life_pulse_path(redirect_id), notice: 'Life Pulse picture has been removed.'}
      format.json { head :no_content }
    end
  end
end
