class AboutsController < ApplicationController
  # GET /abouts
  # GET /abouts.json
  def index
    @abouts = About.last

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @abouts }
    end
  end

  # GET /abouts/1
  # GET /abouts/1.json
  def show
    @about = About.find(params[:id])
    @json = About.all.to_gmaps4rails
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @about }
    end
  end

 
  # GET /abouts/1/edit
  def edit
    @about = About.find(params[:id])
  end

  # POST /abouts
  # POST /abouts.json
  def create
    @about = About.new(params[:about])

    respond_to do |format|
      if @about.save
        format.html { redirect_to @about, notice: 'About was successfully created.' }
        format.json { render json: @about, status: :created, location: @about }
      else
        format.html { render action: "new" }
        format.json { render json: @about.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /abouts/1
  # PUT /abouts/1.json
  def update
    @about = About.find(params[:id])

    respond_to do |format|
      if @about.update_attributes(params[:about])
        format.html { redirect_to @about, notice: 'About was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @about.errors, status: :unprocessable_entity }
      end
    end
  end

 
end
