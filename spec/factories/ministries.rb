# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :ministry do
    name "MyString"
    contact_person "MyString"
    contact_email "MyString"
    description "MyText"
    display_rank 1
    ta1 "MyText"
    ta2 "MyText"
    ta3 "MyText"
    ta4 "MyText"
    ta5 "MyText"
    advert_main_page false
  end
end
