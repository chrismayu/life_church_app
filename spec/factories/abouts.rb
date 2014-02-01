# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :about do
 
    address "547 Althone"
    city "Woodstock"
    postal_code "N0R1A0"
    phone_number "519-555-1234"
    toll_free_phone_number "1-800-555-1234"
    fax_number "519-555-1234"
    latitude 1.5
    longitude 1.5
    gmaps false
   	youtube "url" 
    facebook "url" 
    video_stream "url"  
    twitter"url"  
    country "My String" 
    province "My String"
    life_pulse false
    leaders_blog false
    store true
    video false
    articles false
    name "Name"
  end
end

 

  