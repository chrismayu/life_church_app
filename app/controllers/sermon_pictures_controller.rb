class SermonPicturesController < ApplicationController
  # GET /sermon_pictures
  # GET /sermon_pictures.json
  load_and_authorize_resource 
  
  before_filter :authenticate_user! 
  def index
    @sermon_pictures = SermonPicture.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sermon_pictures }
    end
  end


  def step_1
        @sermon = Sermon.find(params[:sermons_id])
        @uploader = SermonPicture.new.sermon_image
         @uploader.success_action_redirect = sermon_pictures_step_2_url(:sermons_id => params[:sermons_id])

   end


    def step_2

       @sermon_picture = SermonPicture.new(key: params[:key], sermons_id: params[:sermons_id])

      respond_to do |format|
        if @sermon_picture.save
 
         format.html { redirect_to sermon_path(@sermon_picture.sermons_id), notice: 'This sermon picture was successfully created.' }
         
          else
            format.html { render action: "step_1" }
            format.json { render json: @sermon_picture.errors, status: :unprocessable_entity }
          end
      end

    end






  # GET /sermon_pictures/1
  # GET /sermon_pictures/1.json
  def show
    @sermon_picture = SermonPicture.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @sermon_picture }
    end
  end

  # GET /sermon_pictures/new
  # GET /sermon_pictures/new.json
  def new
    @sermon_picture = SermonPicture.new(key: params[:key])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @sermon_picture }
    end
  end

  # GET /sermon_pictures/1/edit
  def edit
    @sermon_picture = SermonPicture.find(params[:id])
  end

  # POST /sermon_pictures
  # POST /sermon_pictures.json
  def create
    @sermon_picture = SermonPicture.new(params[:sermon_picture])

    respond_to do |format|
      if @sermon_picture.save
        format.html { redirect_to @sermon_picture, notice: 'Sermon picture was successfully created.' }
        format.json { render json: @sermon_picture, status: :created, location: @sermon_picture }
      else
        format.html { render action: "new" }
        format.json { render json: @sermon_picture.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /sermon_pictures/1
  # PUT /sermon_pictures/1.json
  def update
    @sermon_picture = SermonPicture.find(params[:id])

    respond_to do |format|
      if @sermon_picture.update_attributes(params[:sermon_picture])
        format.html { redirect_to @sermon_picture, notice: 'Sermon picture was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @sermon_picture.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sermon_pictures/1
  # DELETE /sermon_pictures/1.json
  def destroy
    @sermon_picture = SermonPicture.find(params[:id])
     redirect_id = @sermon_picture.sermons_id
    @sermon_picture.destroy

    respond_to do |format|
      format.html { redirect_to sermon_path(redirect_id), notice: 'The picture has been removed.'  }
      format.json { head :no_content }
    end
  end
  
  
   
end
