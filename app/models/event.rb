class Event < ActiveRecord::Base
  extend FriendlyId
  friendly_id :event_name, use: :history
  
  attr_accessible :contact_email, :event_type,  :summary, :force_on_main_page,  :enable_disable_ad,  :recurring_day,:template_selected, :no_expiry, :internal_link_url, :internal_link, :recurring_on, :contact_person, :use_contact, :use_form_button, :which_form, :download_link, :share_download, :description, :event_start_time, :display_main_page, :event_date, :event_name, :event_time, :location, :remove_event_date

has_many :event_pictures, :foreign_key => :event_id, :primary_key =>  :id, :inverse_of => :event, :dependent => :destroy
has_many :event_setup_forms, :foreign_key => :event_id, :primary_key =>  :id, :inverse_of => :event 


validates  :event_name, :presence => true  
 


# Ad Events  = 11

#validates   :no_expiry, :if => :for_event_one? 
#validates   :internal_link_url, :if => :for_event_one?
#validates   :internal_link, :if => :for_event_one?
#validates   :recurring_on, :if => :for_event_one?

# Full Events  = 12
#validates :contact_person, :if => :for_event_two?
#validates :use_contact, :if => :for_event_two?
validates_format_of :contact_email, :with => /.+@.+\..+/i,  :presence => {:message => 'Must enter a email address'}, :if => :for_event_two? 
#validates   :use_form_button, :if => :for_event_two?
#validates   :which_form, :if => :for_event_two?
#validates   :download_link, :if => :for_event_two?
#validates   :share_download, :if => :for_event_two?
#validates   :description, :if => :for_event_two?
#validates  :template_selected, :if => :for_event_two?
#validates   :event_start_time, :if => :for_event_two?
#validates   :display_main_page, :if => :for_event_two?
#validates   :event_time, :if => :for_event_two?
#validates   :location, :if => :for_event_two?
validates_datetime :event_date, :if => :val_for_date? 
validates_datetime :remove_event_date, :after => :event_date, :after_message => 'must be before "Start Time"', :if => :val_for_date? 


 
# Cal Only Events  = 13

#validates    :event_type, :if => :for_event_three?
#validates    :summary, :if => :for_event_three?
#validates   :force_on_main_page, :if => :for_event_three?
#validates    :enable_disable_ad, :if => :for_event_three?
#validates    :recurring_day, :if => :for_event_three?
 
 




def val_for_date?
  not_event_one?
end

def val_for_name?
  not_event_one?
end

def val_for_email?
  for_event_two?
end

def not_event_one?
  self.event_type != 11 
end

def for_event_one?
  self.event_type == 11 
end

def for_event_two?
  self.event_type == 12 
end

def for_event_three?
  self.event_type == 13 
end


after_validation :move_friendly_id_error_to_name

  def move_friendly_id_error_to_name
    errors.add :event_name, *errors.delete(:friendly_id) if errors[:friendly_id].present?
  end
   

end
 