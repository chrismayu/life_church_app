class ChurchStaffPicturesController < ApplicationController
  # GET /church_staff_pictures
  # GET /church_staff_pictures.json
  
  load_and_authorize_resource  
  before_filter :authenticate_user! 
  
  
  def step_1
       @uploader = ChurchStaffPicture.new.staff_image
        @uploader.success_action_redirect = church_staff_pictures_step_2_url(:church_staff_id => params[:church_staff_id])

  end


   def step_2

      @church_staff_picture = ChurchStaffPicture.new(key: params[:key], church_staff_id: params[:church_staff_id])
     respond_to do |format|
       if @church_staff_picture.save
         format.html { redirect_to church_staff_path(@church_staff_picture.church_staff_id), notice: 'Church staff picture was successfully created.' }
     
       else
         format.html { render action: "step_1" }
         format.json { render json: @church_staff_picture.errors, status: :unprocessable_entity }
       end
     end




   end
   
   
  
  def index
    @church_staff_pictures = ChurchStaffPicture.all
  
 
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @church_staff_pictures }
    end
  end

  # GET /church_staff_pictures/1
  # GET /church_staff_pictures/1.json
  def show
    @church_staff_picture = ChurchStaffPicture.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @church_staff_picture }
    end
  end

  # GET /church_staff_pictures/new
  # GET /church_staff_pictures/new.json
  def new
    @churchstaff = ChurchStaff.all
    @church_staff_picture = ChurchStaffPicture.new(key: params[:key])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @church_staff_picture }
    end
  end
  


 
  

  # GET /church_staff_pictures/1/edit
  def edit
    @church_staff_picture = ChurchStaffPicture.find(params[:id])
  end

  # POST /church_staff_pictures
  # POST /church_staff_pictures.json
  def create
    @church_staff_picture = ChurchStaffPicture.new(params[:church_staff_picture])

    respond_to do |format|
      if @church_staff_picture.save
        format.html { redirect_to @church_staff_picture, notice: 'Church staff picture was successfully created.' }
        format.json { render json: @church_staff_picture, status: :created, location: @church_staff_picture }
      else
        format.html { render action: "new" }
        format.json { render json: @church_staff_picture.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /church_staff_pictures/1
  # PUT /church_staff_pictures/1.json
  def update
    @church_staff_picture = ChurchStaffPicture.find(params[:id])

    respond_to do |format|
      if @church_staff_picture.update_attributes(params[:church_staff_picture])
        format.html { redirect_to @church_staff_picture, notice: 'Church staff picture was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @church_staff_picture.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /church_staff_pictures/1
  # DELETE /church_staff_pictures/1.json
  def destroy
    @church_staff_picture = ChurchStaffPicture.find(params[:id])
    redirect_id =  @church_staff_picture.church_staff_id
    @church_staff_picture.destroy

    respond_to do |format|
      format.html { redirect_to church_staff_path(redirect_id), notice: 'Staff picture has been removed.'  }
      format.json { head :no_content }
    end
  end
  
  
   
  
  
end
