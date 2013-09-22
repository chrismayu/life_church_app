class ChurchStaffsController < ApplicationController
  # GET /church_staffs
  # GET /church_staffs.json
  
  def current_staff
    
    @church_staffs = ChurchStaff.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @church_staffs }
    end
    
  end
  
  
  
  def index
    @church_staffs = ChurchStaff.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @church_staffs }
    end
  end

  # GET /church_staffs/1
  # GET /church_staffs/1.json
  def show
    @church_staff = ChurchStaff.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @church_staff }
    end
  end

  # GET /church_staffs/new
  # GET /church_staffs/new.json
  def new
    @church_staff = ChurchStaff.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @church_staff }
    end
  end

  # GET /church_staffs/1/edit
  def edit
    @church_staff = ChurchStaff.find(params[:id])
  end

  # POST /church_staffs
  # POST /church_staffs.json
  def create
    @church_staff = ChurchStaff.new(params[:church_staff])
    
    full_name = "#{@church_staff.first_name} #{@church_staff.last_name}"
    @church_staff.update_attribute(:full_name, full_name)

    respond_to do |format|
      if @church_staff.save
        format.html { redirect_to church_staff_path(@church_staff), notice: 'Church staff was successfully created.' }
        format.json { render json: @church_staff, status: :created, location: @church_staff }
      else
        format.html { render action: "new" }
        format.json { render json: @church_staff.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /church_staffs/1
  # PUT /church_staffs/1.json
  def update
    @church_staff = ChurchStaff.find(params[:id])
     full_name = "#{@church_staff.first_name} #{@church_staff.last_name}"
    @church_staff.update_attribute(:full_name, full_name)
    respond_to do |format|
      if @church_staff.update_attributes(params[:church_staff])
        format.html { redirect_to church_staff_path(@church_staff), notice: 'Church staff was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @church_staff.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /church_staffs/1
  # DELETE /church_staffs/1.json
  def destroy
    @church_staff = ChurchStaff.find(params[:id])
    @church_staff.destroy

    respond_to do |format|
      format.html { redirect_to church_staffs_url }
      format.json { head :no_content }
    end
  end
end
