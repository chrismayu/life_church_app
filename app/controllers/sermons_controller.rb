class SermonsController < ApplicationController
  helper_method :sort_column, :sort_direction
  # GET /sermons
  # GET /sermons.json
  load_and_authorize_resource :except => [:index]
  
  before_filter :authenticate_user!, :except => [:index  ]
  
  
  before_filter :find_event, :only => [:show]
  
  def find_event
    @sermon = Sermon.find(params[:id])
    if request.path != sermon_path(@sermon)
        redirect_to @sermon, status: :moved_permanently
    end
  
  end
  
  
  def index
    @sermons = Sermon.search(params[:search]).paginate(:per_page => 5, :page => params[:page])
   # @products = Product.order(sort_column + ' ' + sort_direction).paginate(:per_page => 5, :page => params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sermons }
    end
  end

  # GET /sermons/1
  # GET /sermons/1.json
  def show
    @sermon = Sermon.find(params[:id])
 

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @sermon }
    end
  end

  # GET /sermons/new
  # GET /sermons/new.json
  def new
    @sermon = Sermon.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @sermon }
    end
  end

  # GET /sermons/1/edit
  def edit
    @sermon = Sermon.find(params[:id])
  end

  # POST /sermons
  # POST /sermons.json
  def create
    @sermon = Sermon.new(params[:sermon])

    respond_to do |format|
      if @sermon.save
        format.html { redirect_to sermons_path, notice: 'Sermon was successfully created.' }
        format.json { render json: @sermon, status: :created, location: @sermon }
      else
        format.html { render action: "new" }
        format.json { render json: @sermon.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /sermons/1
  # PUT /sermons/1.json
  def update
    @sermon = Sermon.find(params[:id])

    respond_to do |format|
      if @sermon.update_attributes(params[:sermon])
        format.html { redirect_to sermons_path, notice: 'Sermon was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @sermon.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sermons/1
  # DELETE /sermons/1.json
  def destroy
    @sermon = Sermon.find(params[:id])
    @sermon.destroy

    respond_to do |format|
      format.html { redirect_to sermons_url }
      format.json { head :no_content }
    end
  end
  
  
  private
  
  def sort_column
    Sermon.column_names.include?(params[:sort]) ? params[:sort] : "date_of_sermon"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
