class Event < ActiveRecord::Base
  extend FriendlyId
  friendly_id :event_name, use: :history
  
  attr_accessible :contact_email, :full_event,  :event_type,  :summary, :force_on_main_page,  :enable_disable_ad,  :recurring_day,:template_selected, :no_expiry, :advertisement, :internal_link_url, :internal_link, :recurring_on, :contact_person, :use_contact, :use_form_button, :which_form, :download_link, :share_download, :description, :event_start_time, :display_main_page, :event_date, :event_name, :event_time, :location, :remove_event_date

has_many :event_pictures, :foreign_key => :event_id, :primary_key =>  :id, :inverse_of => :event, :dependent => :destroy
has_many :event_setup_forms, :foreign_key => :event_id, :primary_key =>  :id, :inverse_of => :event 


validates  :event_name, :presence => true   #, :presence => true


#validates  :event_date, :presence => {:if => :paid_with_card?} 
 
#validates  :remove_event_date, :presence => true
 
validates_format_of :contact_email, :with => /.+@.+\..+/i,  :presence => {:message => 'Must enter a email address'}, :if => :val_for_email? 
 
validates_datetime :event_date, :if => :val_for_date? 
validates_datetime :remove_event_date, :after => :event_date, :after_message => 'must be before "Start Time"', :if => :val_for_date? 



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
 