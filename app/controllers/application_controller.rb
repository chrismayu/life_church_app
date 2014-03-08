class ApplicationController < ActionController::Base
   include SimpleCaptcha::ControllerHelpers
   before_filter :beta_login_required

  
  protect_from_forgery
  require 'will_paginate/array'

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end
  
  
  
  before_filter :set_ministries, :setup_about_info, :setup_site_setup_info, :update_last_sign_in_at
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
  
 

      def beta_login_required
        authenticate_or_request_with_http_basic do |username, password|
          username == "foo" && password == "bar"
        end
      end




  def update_last_sign_in_at
    if user_signed_in? && !session[:logged_signin]
      sign_in(current_user, :force => true)
      session[:logged_signin] = true
    end
  end
  
  
end
