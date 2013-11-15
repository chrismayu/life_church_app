class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end
  
  
  
  before_filter :set_ministries, :setup_about_info
  def set_ministries
    @ministries = Ministry.all
  end
  
  def setup_about_info
    @about_menu = About.last
  end
  
  

end
