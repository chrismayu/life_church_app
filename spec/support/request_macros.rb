module RequestMacros
  include Warden::Test::Helpers

  # for use in request specs
  def sign_in_as_a_user
    user = FactoryGirl.create(:volunteer)  
     post_via_redirect user_session_path, 'user[email]' => user.email, 'user[password]' => user.password  
    login_as user
  end
end