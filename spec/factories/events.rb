# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :event do
    event_name "MyString"
    event_date "2013-09-24"
    event_time "MyString"
    contact_email "MyString"
    location "MyString"
    contact_person "MyString"
    description "MyText"
    remove_event_date "2013-09-24"
    display_main_page false
  end
end
