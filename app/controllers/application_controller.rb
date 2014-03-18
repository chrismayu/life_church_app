class ApplicationController < ActionController::Base
   include SimpleCaptcha::ControllerHelpers
   
  protect_from_forgery
  require 'will_paginate/array'

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end
  
  
  
  before_filter :set_ministries, :setup_about_info, :setup_site_setup_info, :update_last_sign_in_at, :require_login
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
       unless request.fullpath == site_setups_site_down_path 
        redirect_to site_setups_site_down_path 
      end
     end
     
   end
     
   end
  
  

  def update_last_sign_in_at
    if user_signed_in? && !session[:logged_signin]
      sign_in(current_user, :force => true)
      session[:logged_signin] = true
    end
  end
  
  
end
