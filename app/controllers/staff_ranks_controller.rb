class StaffRanksController < ApplicationController
  # GET /staff_ranks
  # GET /staff_ranks.json
  def index
    @staff_ranks = StaffRank.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @staff_ranks }
    end
  end

  # GET /staff_ranks/1
  # GET /staff_ranks/1.json
  def show
    @staff_rank = StaffRank.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @staff_rank }
    end
  end

  # GET /staff_ranks/new
  # GET /staff_ranks/new.json
  def new
    @staff_rank = StaffRank.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @staff_rank }
    end
  end

  # GET /staff_ranks/1/edit
  def edit
    @staff_rank = StaffRank.find(params[:id])
  end

  # POST /staff_ranks
  # POST /staff_ranks.json
  def create
    @staff_rank = StaffRank.new(params[:staff_rank])

    respond_to do |format|
      if @staff_rank.save
        format.html { redirect_to @staff_rank, notice: 'Staff rank was successfully created.' }
        format.json { render json: @staff_rank, status: :created, location: @staff_rank }
      else
        format.html { render action: "new" }
        format.json { render json: @staff_rank.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /staff_ranks/1
  # PUT /staff_ranks/1.json
  def update
    @staff_rank = StaffRank.find(params[:id])

    respond_to do |format|
      if @staff_rank.update_attributes(params[:staff_rank])
        format.html { redirect_to @staff_rank, notice: 'Staff rank was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @staff_rank.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /staff_ranks/1
  # DELETE /staff_ranks/1.json
  def destroy
    @staff_rank = StaffRank.find(params[:id])
    @staff_rank.destroy

    respond_to do |format|
      format.html { redirect_to staff_ranks_url }
      format.json { head :no_content }
    end
  end
end
