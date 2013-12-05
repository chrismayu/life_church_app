class HomeController < ApplicationController
  load_and_authorize_resource 
  
  before_filter :authenticate_user! 
  def index
    @users = User.all
  end
end
