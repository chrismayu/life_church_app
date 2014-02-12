# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :event do
    event_name "MyString"
    event_date "2013-09-24"
    event_time "MyString"
    contact_email "ex@example.com"
    location "MyString"
    contact_person "MyString"
    description "MyText"
    remove_event_date "2013-09-24"
    display_main_page false
  end
  
  
  factory :event_full, parent: :event do |f|
    f.event_type  12
    f.event_name "MyString" 
    f.internal_link_url "MyString"
    f.internal_link "MyString"
    f.no_expiry true
    f.recurring_on false
    f.event_date "2013-09-23"
    f.event_time "MyString"
    f.contact_email  "ex@example.com"
    f.location "MyString"
    f.contact_person "MyString"
    f.description "MyText"
    f.remove_event_date "2013-09-24"
    f.display_main_page false
    f.event_start_time "2013-09-23"
    f.template_selected "MyString"
    f.share_download"MyString"
    f.download_link "MyString"
    f.which_form 1
    f.use_form_button false 
    f.use_contact false 
 
 
    
    
  end
  
  
  factory :ads_only, parent: :event do |f|
    f.event_type  11
    f.event_name "MyString" 
    f.no_expiry "MyString"
    f.internal_link_url "MyString"
    f.internal_link  "MyString"
    f.recurring_on "MyString"
  
  end 
  
  factory :cal_only, parent: :event do |f|
    f.event_name "MyString" 
    f.event_type  13
    f.summary "Summary"
    f.force_on_main_page false
    f.enable_disable_ad false
    f.recurring_day "Sunday"
  
  end 
  
 
  
end
 



 