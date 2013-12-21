# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :announcement do
    message "MyText"
    starts_at "2013-12-21 14:36:27"
    ends_at "2013-12-21 14:36:27"
  end
end
