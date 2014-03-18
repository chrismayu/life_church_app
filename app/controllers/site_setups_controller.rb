class SiteSetupsController < ApplicationController
  load_and_authorize_resource  :except => [:site_down]
  before_filter :authenticate_user!, :except => [:site_down] 
 
   #skip_filter :require_login, :only => [:site_down]
   
   
  # GET /site_setups
  # GET /site_setups.json
 

  # GET /site_setups/1
  # GET /site_setups/1.json
  
  def site_down
     
  end
  
  
  
  def show
    authorize! :approve, current_user, :message => 'Sorry - Not authorized - Contact Jason Tucker if page needed.'
  
    @site_setup = SiteSetup.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @site_setup }
    end
  end

  

  # GET /site_setups/1/edit
  def edit
    authorize! :approve, current_user, :message => 'Sorry - Not authorized - Contact Jason Tucker if page needed.'
  
    @site_setup = SiteSetup.find(params[:id])
  end

  

  # PUT /site_setups/1
  # PUT /site_setups/1.json
  def update
    authorize! :approve, current_user, :message => 'Sorry - Not authorized - Contact Jason Tucker if page needed.'
  
    @site_setup = SiteSetup.find(params[:id])

    respond_to do |format|
      if @site_setup.update_attributes(params[:site_setup])
        format.html { redirect_to @site_setup, notice: 'Site setup was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @site_setup.errors, status: :unprocessable_entity }
      end
    end
  end

  
end
