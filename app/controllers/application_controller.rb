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
     unless current_user
        redirect_to new_user_session_path unless request.fullpath == new_user_session_path
       
        #redirect_to (:controller => "authentication", :action => "login")
       
     end
   end
  

  def update_last_sign_in_at
    if user_signed_in? && !session[:logged_signin]
      sign_in(current_user, :force => true)
      session[:logged_signin] = true
    end
  end
  
  
end
