class SchedulesController < ApplicationController
# include ActionView::Helpers::UrlHelper
  
  before_filter :authenticate_user! 
  
  before_filter :find_schedule, :only => [:show]
  
  
  def let_us_know
    AdminMailer.let_us_know(current_user).deliver
    redirect_to( root_path, :notice => "Thanks - Your request was successfully sent. We will be in contact soon")
  end
  
  
  def find_schedule
    @schedule = Schedule.find(params[:id])
    if request.path != schedule_path(@schedule)
        redirect_to @schedule, status: :moved_permanently
    end
  end
 
  def step_1
    authorize! :create, Schedule, :message => 'Not authorized as an administrator.'
    @uploader = Schedule.new.schedule_image
    @uploader.success_action_redirect = new_schedule_url
  end
 
  # GET /schedules
  # GET /schedules.json
  def index
   authorize! :index, Schedule, :message => "Sorry - You need to be a Volunteer to view this - If you need access - #{view_context.link_to('Let us know', root_path)}".html_safe

    @schedules = Schedule.last(3).reverse

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @schedules }
    end
  end

  # GET /schedules/1
  # GET /schedules/1.json
  def show
   authorize! :show, Schedule, :message => 'Sorry - You need to be a Volunteer to view this - If you need access - contact the office.'
   
    @schedule = Schedule.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @schedule }
    end
  end

  # GET /schedules/new
  # GET /schedules/new.json
  def new
    authorize! :new, Schedule, :message => 'Not authorized as an administrator.'
    @schedule = Schedule.new(key: params[:key])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @schedule }
    end
  end

  # GET /schedules/1/edit
  def edit
       authorize! :edit, Schedule, :message => 'Not authorized as an administrator.'
    @schedule = Schedule.find(params[:id])
  end

  # POST /schedules
  # POST /schedules.json
  def create
       authorize! :create, Schedule, :message => 'Not authorized as an administrator.'
    @schedule = Schedule.new(params[:schedule])

    respond_to do |format|
      if @schedule.save
        format.html { redirect_to @schedule, notice: 'Schedule was successfully created.' }
        format.json { render json: @schedule, status: :created, location: @schedule }
      else
        format.html { render action: "new" }
        format.json { render json: @schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /schedules/1
  # PUT /schedules/1.json
  def update
       authorize! :update, Schedule, :message => 'Not authorized as an administrator.'
    @schedule = Schedule.find(params[:id])

    respond_to do |format|
      if @schedule.update_attributes(params[:schedule])
        format.html { redirect_to @schedule, notice: 'Schedule was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /schedules/1
  # DELETE /schedules/1.json
  def destroy
     authorize! :destroy, Schedule, :message => 'Not authorized as an administrator.'
    @schedule = Schedule.find(params[:id])
    @schedule.destroy

    respond_to do |format|
      format.html { redirect_to schedules_url }
      format.json { head :no_content }
    end
  end
end
