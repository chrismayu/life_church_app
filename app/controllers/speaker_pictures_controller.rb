class SpeakerPicturesController < ApplicationController
  # GET /speaker_pictures
  # GET /speaker_pictures.json
  def index
    @speaker_pictures = SpeakerPicture.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @speaker_pictures }
    end
  end

  # GET /speaker_pictures/1
  # GET /speaker_pictures/1.json
  def show
    @speaker_picture = SpeakerPicture.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @speaker_picture }
    end
  end

  # GET /speaker_pictures/new
  # GET /speaker_pictures/new.json
  def new
    @speaker_picture = SpeakerPicture.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @speaker_picture }
    end
  end

  # GET /speaker_pictures/1/edit
  def edit
    @speaker_picture = SpeakerPicture.find(params[:id])
  end

  # POST /speaker_pictures
  # POST /speaker_pictures.json
  def create
    @speaker_picture = SpeakerPicture.new(params[:speaker_picture])

    respond_to do |format|
      if @speaker_picture.save
        format.html { redirect_to @speaker_picture, notice: 'Speaker picture was successfully created.' }
        format.json { render json: @speaker_picture, status: :created, location: @speaker_picture }
      else
        format.html { render action: "new" }
        format.json { render json: @speaker_picture.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /speaker_pictures/1
  # PUT /speaker_pictures/1.json
  def update
    @speaker_picture = SpeakerPicture.find(params[:id])

    respond_to do |format|
      if @speaker_picture.update_attributes(params[:speaker_picture])
        format.html { redirect_to @speaker_picture, notice: 'Speaker picture was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @speaker_picture.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /speaker_pictures/1
  # DELETE /speaker_pictures/1.json
  def destroy
    @speaker_picture = SpeakerPicture.find(params[:id])
    @speaker_picture.destroy

    respond_to do |format|
      format.html { redirect_to speaker_pictures_url }
      format.json { head :no_content }
    end
  end
end
