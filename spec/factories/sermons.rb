# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :sermon do
    date_of_sermon DateTime.now - 3.days
    title "MyString"
    description "MyText"
    category "MyString"
    audio_url "MyString"
    video_url "MyString"
    display_until  DateTime.now + 3.days
    speaker_id 1
    members_only false
    url "MyString"
  end
end
