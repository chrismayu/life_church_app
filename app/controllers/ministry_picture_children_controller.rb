class MinistryPictureChildrenController < ApplicationController
  # GET /ministry_picture_children
  # GET /ministry_picture_children.json
  def index
    @ministry_picture_children = MinistryPictureChild.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ministry_picture_children }
    end
  end

  # GET /ministry_picture_children/1
  # GET /ministry_picture_children/1.json
  def show
    @ministry_picture_child = MinistryPictureChild.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ministry_picture_child }
    end
  end
  
  
  
  
  

  def step_1
        @uploader = MinistryPictureChild.new.ministrychild_image
         @uploader.success_action_redirect = ministry_picture_children_step_2_url(:ministry_id => params[:ministry_id])

   end


    def step_2

       @ministry_picture_child = MinistryPictureChild.new(key: params[:key], ministry_id: params[:ministry_id])

      respond_to do |format|
        if @ministry_picture_child.save
 
         format.html { redirect_to ministry_child_path(@ministry_picture_child.ministry_id), notice: 'This ministry picture was successfully created.' }
         
          else
            format.html { render action: "step_1" }
            format.json { render json: @ministry_picture_child.errors, status: :unprocessable_entity }
          end
      end

    end

  # GET /ministry_picture_children/new
  # GET /ministry_picture_children/new.json
  def new
    @ministry_picture_child = MinistryPictureChild.new(key: params[:key])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ministry_picture_child }
    end
  end

  # GET /ministry_picture_children/1/edit
  def edit
    @ministry_picture_child = MinistryPictureChild.find(params[:id])
  end

  # POST /ministry_picture_children
  # POST /ministry_picture_children.json
  def create
    @ministry_picture_child = MinistryPictureChild.new(params[:ministry_picture_child])

    respond_to do |format|
      if @ministry_picture_child.save
        format.html { redirect_to @ministry_picture_child, notice: 'Ministry picture child was successfully created.' }
        format.json { render json: @ministry_picture_child, status: :created, location: @ministry_picture_child }
      else
        format.html { render action: "new" }
        format.json { render json: @ministry_picture_child.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ministry_picture_children/1
  # PUT /ministry_picture_children/1.json
  def update
    @ministry_picture_child = MinistryPictureChild.find(params[:id])

    respond_to do |format|
      if @ministry_picture_child.update_attributes(params[:ministry_picture_child])
        format.html { redirect_to @ministry_picture_child, notice: 'Ministry picture child was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @ministry_picture_child.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ministry_picture_children/1
  # DELETE /ministry_picture_children/1.json
  def destroy
    @ministry_picture_child = MinistryPictureChild.find(params[:id])
    redirect_id = @ministry_picture_child.ministry_id
    @ministry_picture_child.destroy

 
        respond_to do |format|
          format.html { redirect_to ministry_child_path(redirect_id), notice: 'The picture has been removed.'  }
          format.json { head :no_content }
        end
  end
end
