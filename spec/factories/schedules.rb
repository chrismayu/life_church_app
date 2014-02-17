# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :schedule do
    name "MyString"
    description "MyText"
    end_month "2014-02-17"
    start_month "2014-02-17"
    schedule_image "MyString"
    image_processed false
    slug "MyString"
    url "MyString"
  end
end
