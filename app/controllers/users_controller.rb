class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    authorize! :index, @user, :message => 'Not authorized as an administrator.'
                 if params[:approved] == "false"
                         @users = User.find_all_by_approved(false)
                         @user_count = User.find_all_by_approved(false).count
                         @approved = true
                 else
                         @users = User.all
                         @user_count = User.count
                         @approved = false
                 end
         end
        
  def approve
      authorize! :approve, @user, :message => 'Not authorized as an administrator.'
                 user = User.find(params[:id])
                 user.update_attributes(:approved => true)
                 MemberMailer.your_approved(user).deliver
                 redirect_to :action => "index", :approved => "false"
  end
  


 



  def show
    @user = User.find(params[:id])
    unless current_user.has_role? :admin
    if current_user != @user 
      redirect_to root_path, alert: 'Not authorized as an administrator.'
    end
    end
 
  end
  
  def update
    authorize! :update, @user, :message => 'Not authorized as an administrator.'
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user], :as => :admin)
      redirect_to users_path, :notice => "User updated."
    else
      redirect_to users_path, :alert => "Unable to update user."
    end
  end
    
  def destroy
    authorize! :destroy, @user, :message => 'Not authorized as an administrator.'
    user = User.find(params[:id])
    unless user == current_user
      user.destroy
      redirect_to users_path, :notice => "User deleted."
    else
      redirect_to users_path, :notice => "Can't delete yourself."
    end
  end
end