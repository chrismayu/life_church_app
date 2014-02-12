module ControllerMacros
 
  def controller_login_admin
    before(:each) do
     # @request.env["devise.mapping"] = Devise.mappings[:admin]
      @admin ||= FactoryGirl.create(:admin) # Using factory girl as an example
       sign_in @admin
     
      end
  end

  def controller_login_user
    before(:each) do
     # @request.env["devise.mapping"] = Devise.mappings[:user]
      @user ||= FactoryGirl.create(:user) 
       sign_in @user
      
    end
  end
  
 
  
  
end