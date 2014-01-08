# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :life_pulse do
    keywords "MyString"
    from_pastor_desk false
    template_selected 1
    content "MyText"
    title "MyString"
    summary "MyString"
    flickr_id "MyString"
  end
end
