class ContactEventController < ApplicationController
  def new 
       @message = Message.new(:staff => params[:event]) 
        @events = Event.where(:id=> @message.staff).last
     end

     def create
       @message = Message.new(params[:message])
       
       unless @message.staff.empty?
       @event = Event.where(:id=> @message.staff).last
       
          @message.staff_email = @event.contact_email
         @message.staff_name = @event.contact_person
         @message.event_name = @event.event_name
         
        else
        @message.staff_email = "life@lifeinyou.com"
       
       end
        
       if @message.valid?
          EventMailer.event_message(@message).deliver
         redirect_to(learn_more_path(@event.id), :notice => "Your message was successfully sent.")
       else
         flash.now.alert = "Please fill all fields."
         render :new
       end
     end
end
