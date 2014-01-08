# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :site_setup do
    youtube "MyString"
    facebook "MyString"
    video_stream "MyString"
    twitter "MyString"
    life_pulse false
    leaders_blog false
    store false
    video false
    articles false
  end
end
