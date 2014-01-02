class Event < ActiveRecord::Base
  extend FriendlyId
  friendly_id :event_name, use: :history
  
  attr_accessible :contact_email, :recurring_day, :no_expiry, :advertisement, :internal_link_url, :internal_link, :recurring_on, :contact_person, :use_contact, :use_form_button, :which_form, :download_link, :share_download, :description, :event_start_time, :display_main_page, :event_date, :event_name, :event_time, :location, :remove_event_date

has_many :event_pictures, :foreign_key => :event_id, :primary_key =>  :id, :inverse_of => :event, :dependent => :destroy
has_many :event_setup_forms, :foreign_key => :event_id, :primary_key =>  :id, :inverse_of => :event 


validates  :event_name, :presence => true
validates  :event_date, :presence => true
validates  :remove_event_date, :presence => true
 
validates_format_of :contact_email, :with => /.+@.+\..+/i,  :presence => {:message => 'Must enter a email address'}
 
validates_datetime :event_date
validates_datetime :remove_event_date, :after => :event_date, :after_message => 'must be before "Start Time"'


after_validation :move_friendly_id_error_to_name

  def move_friendly_id_error_to_name
    errors.add :event_name, *errors.delete(:friendly_id) if errors[:friendly_id].present?
  end
   

end
 