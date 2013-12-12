class EgivingsController < ApplicationController
  
    load_and_authorize_resource :except => [:new, :create, :completed]
     before_filter :authenticate_user!, :except => [:new, :create, :completed]
 
 
 
     def completed
         @egiving = Egiving.find(params[:id])

         respond_to do |format|
           format.html # show.html.erb
           format.json { render json: @egiving }
         end
     end
 
 
 
 
  # GET /egivings
  # GET /egivings.json
  def index
    @egivings = Egiving.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @egivings }
    end
  end

  # GET /egivings/1
  # GET /egivings/1.json
  def show
    @egiving = Egiving.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @egiving }
      format.pdf do
        pdf = TaxReceiptsPdf.new(@egiving, view_context)
        send_data pdf.render, filename: "tax_receipt_#{@egiving.id}",
                                type: "application/pdf",
                                disposition: "inline"
      end
      
    end
  end

  # GET /egivings/new
  # GET /egivings/new.json
  def new
    @egiving = Egiving.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @egiving }
    end
  end

  # GET /egivings/1/edit
  def edit
    @egiving = Egiving.find(params[:id])
  end

  # POST /egivings
  # POST /egivings.json
  def create
    @egiving = Egiving.new(params[:egiving])
    @notification = Notification.last
  
  
    respond_to do |format|
      if @egiving.save
      
      
       format.html { redirect_to egivings_completed_path(:id => @egiving), notice: 'Your E-Giving has been successfully Completed.' }
       ReceivedMailer.new_e_giving(@egiving, @notification.email_1).deliver
       ReceivedMailer.new_e_giving(@egiving, @notification.email_2).deliver
       
       
       
       
       
     require 'egivings_controller'
       
       if @egiving.country == "United States"
          ThanksMailer.thankyouus(@egiving).deliver
          
        else 
           if @egiving.country == "Canada"
              ThanksMailer.thankyou(@egiving).deliver

       else
              ThanksMailer.thankyouother(@egiving).deliver
       
     end 
       end
     
     
     
      else
        format.html { render action: "new" }
        format.json { render json: @egiving.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /egivings/1
  # PUT /egivings/1.json
  def update
    @egiving = Egiving.find(params[:id])

    respond_to do |format|
      if @egiving.update_attributes(params[:egiving])
        format.html { redirect_to  @egiving, notice: 'Your E-Giving has been successfully Updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @egiving.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /egivings/1
  # DELETE /egivings/1.json
  def destroy
    @egiving = Egiving.find(params[:id])
    @egiving.destroy

    respond_to do |format|
      format.html { redirect_to egivings_url }
      format.json { head :no_content }
    end
  end
end
