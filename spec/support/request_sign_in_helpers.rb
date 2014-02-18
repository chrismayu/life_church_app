module RequestSignInHelpers
  include Warden::Test::Helpers
 
  def login_admin
    before(:each) do
      user = FactoryGirl.create(:admin)  
       post_via_redirect user_session_path, 'user[email]' => user.email, 'user[password]' => user.password  
      login_as user
    end
  end

  def login_volunteer
    before(:each) do
      user = FactoryGirl.create(:volunteer)  
       post_via_redirect user_session_path, 'user[email]' => user.email, 'user[password]' => user.password  
      login_as user
      
    end
  end
  
  def login_member
    before(:each) do
      user = FactoryGirl.create(:member)  
       post_via_redirect user_session_path, 'user[email]' => user.email, 'user[password]' => user.password  
      login_as user
      
    end
  end
 
  
  
end