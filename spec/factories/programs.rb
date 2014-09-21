# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :program do
    program_name "MyString"
    contact_email "MyString"
    location "MyString"
    contact_person "MyString"
    description "MyText"
    remove_program_date "2014-09-19"
    display_main_page false
  end
end
