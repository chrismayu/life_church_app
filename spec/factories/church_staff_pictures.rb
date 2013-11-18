# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :church_staff_picture do
    first_name "MyString"
    last_name "MyString"
    image "MyString"
    church_staff_id 1
    image_processed false
    remote_image_url "MyString"
  end
end
