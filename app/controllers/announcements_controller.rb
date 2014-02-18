class AnnouncementsController < ApplicationController
  
  load_and_authorize_resource :except => [:hide ]
  
  before_filter :authenticate_user!, :except => [:hide]
  
  def hide
     ids = [params[:id], *cookies.signed[:hidden_announcement_ids]]
     cookies.permanent.signed[:hidden_announcement_ids] = ids
     redirect_to :back
   end
  
  # GET /announcements
  # GET /announcements.json
  def index
    authorize! :approve, current_user, :message => 'Sorry - Not authorized - Contact Jason Tucker if page needed.'
  
    @announcements = Announcement.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @announcements }
    end
  end

  # GET /announcements/1
  # GET /announcements/1.json
  def show
    authorize! :approve, current_user, :message => 'Sorry - Not authorized - Contact Jason Tucker if page needed.'
  
    @announcement = Announcement.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @announcement }
    end
  end

  # GET /announcements/new
  # GET /announcements/new.json
  def new
    authorize! :approve, current_user, :message => 'Sorry - Not authorized - Contact Jason Tucker if page needed.'
  
    @announcement = Announcement.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @announcement }
    end
  end

  # GET /announcements/1/edit
  def edit
    authorize! :approve, current_user, :message => 'Sorry - Not authorized - Contact Jason Tucker if page needed.'
  
    @announcement = Announcement.find(params[:id])
  end

  # POST /announcements
  # POST /announcements.json
  def create
    authorize! :approve, current_user, :message => 'Sorry - Not authorized - Contact Jason Tucker if page needed.'
  
    @announcement = Announcement.new(params[:announcement])

    respond_to do |format|
      if @announcement.save
        format.html { redirect_to @announcement, notice: 'Announcement was successfully created.' }
        format.json { render json: @announcement, status: :created, location: @announcement }
      else
        format.html { render action: "new" }
        format.json { render json: @announcement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /announcements/1
  # PUT /announcements/1.json
  def update
    authorize! :update, current_user, :message => 'Sorry - Not authorized - Contact Jason Tucker if page needed.'
  
    @announcement = Announcement.find(params[:id])

    respond_to do |format|
      if @announcement.update_attributes(params[:announcement])
        format.html { redirect_to @announcement, notice: 'Announcement was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @announcement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /announcements/1
  # DELETE /announcements/1.json
  def destroy
    authorize! :destroy, current_user, :message => 'Sorry - Not authorized - Contact Jason Tucker if page needed.'
  
    @announcement = Announcement.find(params[:id])
    @announcement.destroy

    respond_to do |format|
      format.html { redirect_to announcements_url }
      format.json { head :no_content }
    end
  end
end
