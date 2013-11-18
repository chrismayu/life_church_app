# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :ministry_picture do
    ministry_image "MyString"
    image_processed false
    ministries_id 1
  end
end
