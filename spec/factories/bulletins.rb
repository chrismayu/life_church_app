# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :bulletin do
    name "MyString"
    description "MyText"
    display_till "2013-11-19"
    display_start "2013-11-19"
    advert_main_page false
    bulletin_image "MyString"
    url "MyString"
    members_only false
  end
end
