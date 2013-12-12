# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :notification do
    email_1 "MyString"
    email_2 "MyString"
    send_email_2 false
    open_site false
  end
end
