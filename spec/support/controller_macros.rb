module ControllerMacros
 
  def login_admin
    before(:each) do
     # @request.env["devise.mapping"] = Devise.mappings[:admin]
      user = FactoryGirl.create(:admin) # Using factory girl as an example
       post_via_redirect user_session_path, 'user[email]' => user.email, 'user[password]' => user.password
    end
  end

  def login_user
    before(:each) do
     # @request.env["devise.mapping"] = Devise.mappings[:user]
      @user = FactoryGirl.create(:user)
      #user.confirm! # or set a confirmed_at inside the factory. Only necessary if you are using the confirmable module
      #sign_in user
    
      post_via_redirect user_session_path, 'user[email]' => @user.email, 'user[password]' => @user.password
      
      
    end
  end
  
 
  
  
end