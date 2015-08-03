class FaqsController < ApplicationController

 before_filter :authenticate_user!, :except => [:faq]
  def faq
    
     if user_signed_in?  
       @faqs = Faq.members
       
    if current_user.has_role? :editor
       @faqs = Faq.editor
    end
    
    if current_user.has_role? :admin 
       @faqs = Faq.all
    end
    
 
    
  else
    
    @faqs = Faq.non_members
    
  end
      
 

    respond_to do |format|
      format.html # index.html.erb 
    end
  end



  # GET /faqs
  # GET /faqs.json
  def index
    @faqs = Faq.all

    respond_to do |format|
      format.html # index.html.erb 
      format.xls do 
   
        
         render :xls => @faqs,
             :columns => [ :id, :admin, :answer, :member_only, :title, :user_id, :the_answer, :editor ],
           :headers => %w[ ID admin answer member_only title user_id the_answer editor ] 

        end
    
    
    end
    
    
    
  end

 
  # GET /faqs/new
  # GET /faqs/new.json
  def new
    @faq = Faq.new

    respond_to do |format|
      format.html # new.html.erb 
    end
  end

  # GET /faqs/1/edit
  def edit
    @faq = Faq.find(params[:id])
  end

  # POST /faqs
  # POST /faqs.json
  def create
    @faq = Faq.new(params[:faq])

    respond_to do |format|
      if @faq.save
        format.html { redirect_to faq_s_path, notice: 'The Frequently Asked Question was successfully created.' }
       
      else
        format.html { render action: "new" }
 
      end
    end
  end

  # PUT /faqs/1
  # PUT /faqs/1.json
  def update
    @faq = Faq.find(params[:id])

    respond_to do |format|
      if @faq.update_attributes(params[:faq])
        format.html { redirect_to faq_s_path, notice: 'Frequently Asked Question was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @faq.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /faqs/1
  # DELETE /faqs/1.json
  def destroy
    @faq = Faq.find(params[:id])
    @faq.destroy

    respond_to do |format|
      format.html { redirect_to faq_s_url }
      format.json { head :no_content }
    end
  end
end
