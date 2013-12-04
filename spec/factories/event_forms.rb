# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :event_form do
    event_setup_form_id 1
    first_name "MyString"
    last_name "MyString"
    receive_emails "MyString"
    email "MyString"
    phone_number "MyString"
    notes "MyText"
    c_f_1_s "MyString"
    c_f_2_s "MyString"
    c_f_3_s "MyString"
    c_f_4_s "MyString"
    c_f_5_b false
    c_f_6_b false
    c_f_7_b false
    c_f_8_b false
    c_f_9_t "MyText"
    c_f_10_t "MyText"
    c_f_11_t "MyText"
    c_f_12_t "MyText"
    age 1
    bday "2013-12-04"
    sex "MyString"
  end
end
