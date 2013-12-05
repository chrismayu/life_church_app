class Event < ActiveRecord::Base
  attr_accessible :contact_email, :contact_person, :use_contact, :use_form_button, :which_form, :download_link, :share_download, :description, :event_start_time, :display_main_page, :event_date, :event_name, :event_time, :location, :remove_event_date

has_many :event_pictures, :foreign_key => :event_id, :primary_key =>  :id, :inverse_of => :event, :dependent => :destroy
has_many :event_setup_forms, :foreign_key => :event_id, :primary_key =>  :id, :inverse_of => :event 


validates  :event_name, :presence => true
validates  :event_date, :presence => true
validates  :remove_event_date, :presence => true
 
validates_format_of :contact_email, :with => /.+@.+\..+/i,  :presence => {:message => 'Must enter a email address'}
 
validates_datetime :event_date
validates_datetime :remove_event_date, :after => :event_date, :after_message => 'must be before "Start Time"'

   

end
 