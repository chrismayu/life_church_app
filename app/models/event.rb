class Event < ActiveRecord::Base
  attr_accessible :contact_email, :contact_person, :description, :event_start_time, :display_main_page, :event_date, :event_name, :event_time, :location, :remove_event_date

has_many :event_pictures, :foreign_key => :event_id, :primary_key =>  :id, :inverse_of => :event, :dependent => :destroy


validates  :event_name, :presence => true
validates  :event_date, :presence => true
validates  :remove_event_date, :presence => true
 
validates_datetime :event_date
validates_datetime :remove_event_date, :after => :event_date, :after_message => 'must be before "Start Time"'



end
