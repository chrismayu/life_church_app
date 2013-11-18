# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :church_staff do
    first_name "MyString"
    last_name "MyString"
    spouse_first_name "MyString"
    title "MyString"
    started_service "2013-09-17"
    description "MyText"
    contact_email "MyString"
    image "MyString"
  end
end
