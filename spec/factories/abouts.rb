# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :about do
    service_day_1 "MyString"
    service_time_1 "MyString"
    service_day_2 "MyString"
    service_time_2 "MyString"
    service_day_3 "MyString"
    service_time_3 "MyString"
    address "MyString"
    city "MyString"
    postal_code "MyString"
    phone_number "MyString"
    toll_free_phone_number "MyString"
    fax_number "MyString"
    latitude 1.5
    longitude 1.5
    gmaps false
  end
end
