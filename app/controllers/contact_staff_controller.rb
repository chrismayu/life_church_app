class ContactStaffController < ApplicationController
  
  
   def new 
      @user = current_user
        @message = Message.new(:staff => params[:staff])
        @church_staff = ChurchStaff.where(:email_id=> @message.staff).last
      end

      def create
        @message = Message.new(params[:message])
        
        unless @message.staff.empty?
        @church_staff = ChurchStaff.where(:email_id=> @message.staff).last
        
           @message.staff_email = @church_staff.contact_email
          @message.staff_name = @church_staff.full_name
         else
         @message.staff_email = "chrismayu@gmail.com"  #"life@lifeinyou.com"
         @message.staff_name = "Chris"
        end
         
        if @message.valid?
           StaffMailer.staff_message(@message).deliver
          redirect_to(church_staffs_current_staff_path, :notice => "Your message was successfully sent.")
        else
          flash.now.alert = "Please fill all fields."
          render :new
        end
      end
end
