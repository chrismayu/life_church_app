class ContactTechController < ApplicationController
  
   def new
      @user = current_user
       @message = Message.new
     end

     def create
       @message = Message.new(params[:message])



       if @message.valid?
         
          #word_wrap(@message.body, line_width: 550)
         
         TechMailer.tech_support(@message).deliver
         redirect_to(root_path, :notice => "Your message was successfully sent.")
       else
         flash.now.alert = "Please fill all fields."
         render :new
       end
     end
end
