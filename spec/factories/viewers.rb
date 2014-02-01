FactoryGirl.define do
  factory :viewer do
    name 'Test User'
    email 'example@example.com'
    password 'changeme'
    password_confirmation 'changeme'
 
  end
end