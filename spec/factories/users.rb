# Read about factories at https://github.com/thoughtbot/factory_girl
  
 
  
  FactoryGirl.define do
    factory :user do
      name "ChrisMayu"
      email "your@mail.com"
      password "helloworld"
      password_confirmation "helloworld"
      # required if the Devise Confirmable module is used
     # confirmed_at Time.now

      factory :admin do
          after(:create) {|user| user.add_role(:admin)}
      end

      factory :member do
          after(:create) {|user| user.add_role(:member)}
      end

      factory :confirmed_user, :parent => :user do
        after(:create) { |user| user.confirm! }
      end
    end
  end
  
   