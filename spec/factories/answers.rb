# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :answer do
    title "MyString"
    admin false
    member_only false
    answer "MyText"
    faq_id 1
    user_id 1
  end
end
