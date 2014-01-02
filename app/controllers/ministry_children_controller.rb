class MinistryChildrenController < ApplicationController
  # GET /ministry_children
  # GET /ministry_children.json
  load_and_authorize_resource  
  
  before_filter :authenticate_user! 
  
  def index
    @ministry_children = MinistryChild.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ministry_children }
    end
  end

  # GET /ministry_children/1
  # GET /ministry_children/1.json
  def show
    @ministry_child = MinistryChild.find(params[:id])
    @ministry = Ministry.find(@ministry_child.ministry.id)
    if request.path != ministry_children_path(@ministry_child)
        redirect_to @ministry_child, status: :moved_permanently
    end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ministry_child }
    end
  end

  # GET /ministry_children/new
  # GET /ministry_children/new.json
  def new
     @ministry = Ministry.where(:id => params[:ministry_id]).last 
  
    @ministry_child = MinistryChild.new(:ministry_id => params[:ministry_id])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ministry_child }
    end
  end

  # GET /ministry_children/1/edit
  def edit
    @ministry_child = MinistryChild.find(params[:id])
    
    
    
  end

  # POST /ministry_children
  # POST /ministry_children.json
  def create
    @ministry_child = MinistryChild.new(params[:ministry_child])

    respond_to do |format|
      if @ministry_child.save
        format.html { redirect_to ministry_path(@ministry_child.ministry.id), notice: 'Ministry child was successfully created.' }
        format.json { render json: @ministry_child, status: :created, location: @ministry_child }
      else
        format.html { render action: "new" }
        format.json { render json: @ministry_child.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ministry_children/1
  # PUT /ministry_children/1.json
  def update
    @ministry_child = MinistryChild.find(params[:id])

    respond_to do |format|
      if @ministry_child.update_attributes(params[:ministry_child])
        format.html { redirect_to ministry_path(@ministry_child.ministry.id), notice: 'Ministry child was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @ministry_child.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ministry_children/1
  # DELETE /ministry_children/1.json
  def destroy
    @ministry_child = MinistryChild.find(params[:id])
 
    redirect_id = @ministry_child.ministry_id
    @ministry_child.destroy
 
    respond_to do |format|
      format.html { redirect_to ministry_path(redirect_id) }
      format.json { head :no_content }
    end
  end
end
