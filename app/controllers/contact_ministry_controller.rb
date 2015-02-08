class ContactMinistryController < ApplicationController
  def new 
     @user = current_user
       @message = Message.new 
        @ministries = Ministry.where(:id=> params[:ministry]).last
     end

     def create
       @message = Message.new(params[:message])
       
       unless @message.ministry_id.empty?
       @ministries = Ministry.where(:id=> @message.ministry_id).last
       
          @message.staff_email = @ministries.contact_email
         @message.staff_name = @ministries.contact_person
         @message.event_name = @ministries.name
         
        else
        @message.staff_email = "life@lifeinyou.com"
       
       end
        
       if @message.valid?
         MinistryMailer.ministry_message(@message).deliver
         redirect_to(ministry_path(@ministries.id), :notice =>"Your message was successfully sent.")
       else
         flash.now.alert = "Please fill all fields."
          render :new 
       
       end
     end
end
