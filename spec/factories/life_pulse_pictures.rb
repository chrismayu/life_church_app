# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :life_pulse_picture do
    life_pulse_id 1
    life_pulse_image "MyString"
    title "MyString"
    summary "MyString"
    image_processed false
    main_page false
  end
end
