class SpeakerPicturesController < ApplicationController
  # GET /speaker_pictures
  # GET /speaker_pictures.json
  load_and_authorize_resource  
  
  before_filter :authenticate_user! 
  
  
  def step_1
        @uploader = SpeakerPicture.new.speaker_image
         @uploader.success_action_redirect = speaker_pictures_step_2_url(:speaker_id => params[:speaker_id])
     # PdfDocument.create!(key: params[:key], :thumb => "thumb", :pdf_form => "Passport", :pdf_passport => true, applicant_id: params[:applicant_id])

     # @uploader.key = @pdf_document.applicant_id
     # @uploader.success_action_redirect = new_pdf_document_url(:speaker_id => params[:speaker_id])



   end


    def step_2

       @speaker_picture = SpeakerPicture.new(key: params[:key], speaker_id: params[:speaker_id])

      respond_to do |format|
        if @speaker_picture.save
         #  format.html { redirect_to @speaker_picture, notice: 'Speaker picture was successfully created.' }
           #format.html { redirect_to @speaker_picture, notice: 'Speaker picture was successfully created.' }

         format.html { redirect_to speaker_path(@speaker_picture.speaker_id), notice: 'This Speaker picture was successfully created.' }
          # format.html { redirect_to speakers_path, notice: 'This Speaker picture was successfully created.' }

          else
            format.html { render action: "step_1" }
            format.json { render json: @speaker_picture.errors, status: :unprocessable_entity }
          end
      end

    end
  
  
  
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
    @speaker_picture = SpeakerPicture.new(key: params[:key])

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
      redirect_id = @speaker_picture.speaker_id
      @speaker_picture.destroy

      respond_to do |format|
        format.html { redirect_to speaker_path(redirect_id), notice: 'Speaker picture has been removed.'  }
        format.json { head :no_content }
    end
  end
end
