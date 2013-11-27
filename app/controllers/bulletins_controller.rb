class BulletinsController < ApplicationController
  # GET /bulletins
  # GET /bulletins.json
  load_and_authorize_resource :except => [:index, :show ]
  
  before_filter :authenticate_user!, :except => [:index, :show ]
  
  def step_1
    @uploader = Bulletin.new.bulletin_image
    @uploader.success_action_redirect = new_bulletin_url
 
    
  end
  
  
  def index
    @bulletins = Bulletin.all
    
 
     
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @bulletins }
    end
  end

  # GET /bulletins/1
  # GET /bulletins/1.json
  def show
    @bulletin = Bulletin.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @bulletin }
    end
  end

  # GET /bulletins/new
  # GET /bulletins/new.json
  def new
    @bulletin = Bulletin.new(key: params[:key])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @bulletin }
    end
  end

  # GET /bulletins/1/edit
  def edit
    @bulletin = Bulletin.find(params[:id])
  end

  # POST /bulletins
  # POST /bulletins.json
  def create
    @bulletin = Bulletin.new(params[:bulletin])
    
     @bulletin.display_till =  @bulletin.set_display_till_date(@bulletin)

    respond_to do |format|
      if @bulletin.save
        format.html { redirect_to @bulletin, notice: 'Bulletin was successfully created.' }
        format.json { render json: @bulletin, status: :created, location: @bulletin }
      else
        format.html { render action: "new" }
        format.json { render json: @bulletin.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /bulletins/1
  # PUT /bulletins/1.json
  def update
    @bulletin = Bulletin.find(params[:id])
   
    respond_to do |format|
      if @bulletin.update_attributes(params[:bulletin])
        format.html { redirect_to @bulletin, notice: 'Bulletin was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @bulletin.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bulletins/1
  # DELETE /bulletins/1.json
  def destroy
    @bulletin = Bulletin.find(params[:id])
    @bulletin.destroy

    respond_to do |format|
      format.html { redirect_to bulletins_url }
      format.json { head :no_content }
    end
  end
end
