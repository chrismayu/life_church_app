# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :egiving do
    amount 1
    send_email_giver false
    email_of_giver "MyString"
    name_on_card ""
    name_on_card_key ""
    name_on_card_iv ""
    card_number ""
    card_number_key ""
    card_number_iv ""
    ccv_number ""
    ccv_number_key ""
    ccv_number_iv ""
    date_month ""
    date_month_key ""
    date_month_iv ""
    date_year ""
    date_year_key ""
    date_year_iv ""
    giving "MyString"
    year 1
    card_type "MyString"
    amountfinal "9.99"
    propose_of_donation "MyString"
    first_name "MyString"
    last_name "MyString"
    address "MyString"
    city "MyString"
    province "MyString"
    country "MyString"
    postal_code "MyString"
    phone_number "MyString"
    finalamount 1.5
  end
end
