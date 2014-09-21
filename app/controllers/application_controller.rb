class ApplicationController < ActionController::Base
   include SimpleCaptcha::ControllerHelpers
   
  protect_from_forgery
  require 'will_paginate/array'

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end
  
  
  
  before_filter :set_ministries, :setup_about_info, :setup_site_setup_info, :update_last_sign_in_at, :require_login 

  after_filter :store_location

  def store_location
    # store last url - this is needed for post-login redirect to whatever the user last visited.
    return unless request.get? 
    if (request.path != "/users/sign_in" &&
        request.path != "/users/sign_up" &&
        request.path != "/users/password/new" &&
        request.path != "/users/password/edit" &&
        request.path != "/users/confirmation" &&
        request.path != "/users/sign_out" &&
        request.path != "/users/edit_site" &&
        !request.xhr?) # don't store ajax calls
      session[:previous_url] = request.fullpath 
    end
  end

  def after_sign_in_path_for(resource)
    session[:previous_url] || root_path
  end
  
  
 def set_ministries
    @ministries_menu = Ministry.all
  end
  
  def setup_about_info
    @about_menu = About.last
  end
  
  def setup_site_setup_info
    @site_setup_menu = SiteSetup.last
  end  
  
  
  

  protected
  
  def require_login
    
        if @site_setup_menu.shutdown == true
      
           unless current_user 
             lockout
            else
        
               unless current_user.has_role? :admin 
                 lockout
               end
           end    
       end
     
   end
   
   
   def lockout
     
     unless request.fullpath == site_setups_site_down_path 
      redirect_to site_setups_site_down_path 
    end
    
   end
  
  

  def update_last_sign_in_at
    if user_signed_in? && !session[:logged_signin]
      sign_in(current_user, :force => true)
      session[:logged_signin] = true
    end
  end
  
  
end
