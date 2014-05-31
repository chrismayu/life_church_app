class MinistryPicturesController < ApplicationController
  # GET /ministry_pictures
  # GET /ministry_pictures.json
  def index
    @ministry_pictures = MinistryPicture.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ministry_pictures }
    end
  end

  # GET /ministry_pictures/1
  # GET /ministry_pictures/1.json
  def show
    @ministry_picture = MinistryPicture.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ministry_picture }
    end
  end


  def step_1
        @ministry = Ministry.find(params[:ministry_id])
        @uploader = MinistryPicture.new.ministry_image
         @uploader.success_action_redirect = ministry_pictures_step_2_url(:ministry_id => params[:ministry_id])

   end


    def step_2
@ministry = Ministry.find(params[:ministry_id])
       @ministry_picture = MinistryPicture.new(key: params[:key], ministry_id: params[:ministry_id])

      respond_to do |format|
        if @ministry_picture.save
 
         format.html { redirect_to ministry_path(@ministry_picture.ministry_id), notice: 'This ministry picture was successfully created.' }
         
          else
            format.html { render action: "step_1" }
            format.json { render json: @ministry_picture.errors, status: :unprocessable_entity }
          end
      end

    end




  # GET /ministry_pictures/new
  # GET /ministry_pictures/new.json
  def new
    @ministry_picture = MinistryPicture.new(key: params[:key])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ministry_picture }
    end
  end

  # GET /ministry_pictures/1/edit
  def edit
    @ministry_picture = MinistryPicture.find(params[:id])
  end

  # POST /ministry_pictures
  # POST /ministry_pictures.json
  def create
    @ministry_picture = MinistryPicture.new(params[:ministry_picture])

    respond_to do |format|
      if @ministry_picture.save
        format.html { redirect_to @ministry_picture, notice: 'Ministry picture was successfully created.' }
        format.json { render json: @ministry_picture, status: :created, location: @ministry_picture }
      else
        format.html { render action: "new" }
        format.json { render json: @ministry_picture.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ministry_pictures/1
  # PUT /ministry_pictures/1.json
  def update
    @ministry_picture = MinistryPicture.find(params[:id])

    respond_to do |format|
      if @ministry_picture.update_attributes(params[:ministry_picture])
        format.html { redirect_to @ministry_picture, notice: 'Ministry picture was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @ministry_picture.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ministry_pictures/1
  # DELETE /ministry_pictures/1.json
  def destroy
    @ministry_picture = MinistryPicture.find(params[:id])
     redirect_id = @ministry_picture.ministry_id
    @ministry_picture.destroy
  
    
      respond_to do |format|
        format.html { redirect_to ministry_path(redirect_id), notice: 'The picture has been removed.'  }
        format.json { head :no_content }
      end
  end
end
