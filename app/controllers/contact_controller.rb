class ContactController < ApplicationController
    def new 
      
        @user = current_user
        @message = Message.new
    
      end

      def create
        @message = Message.new(params[:message])

        if @message.valid?
           ContactMailer.site_message(@message).deliver
          redirect_to(abouts_path, :notice => "Your message was successfully sent.")
        else
          flash.now.alert = "Please fill all fields."
          render :new
        end
      end
  end

