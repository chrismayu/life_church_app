# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :sermon_picture do
    sermon_image "MyString"
    image_processed false
    sermons_id 1
  end
end
