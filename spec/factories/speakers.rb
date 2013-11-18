# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :speaker do
    title "MyString"
    first_name "MyString"
    last_name "MyString"
    from_church "MyString"
    description "MyText"
    church_staff_id 1
    from_church_url ""
  end
end
