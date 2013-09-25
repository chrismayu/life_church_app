class Event < ActiveRecord::Base
  attr_accessible :contact_email, :contact_person, :description, :display_main_page, :event_date, :event_name, :event_time, :location, :remove_event_date
end
