# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :faq do
    title "MyString"
    user_id 1
    admin false
    member_only false
    answer 1
  end
end
