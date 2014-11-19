class EventForm < ActiveRecord::Base
  attr_accessible :age, :bday, :c_f_10_t, :c_f_11_t, :c_f_12_t, :c_f_1_s, :c_f_2_s, :c_f_3_s, :c_f_4_s, :c_f_5_b, :c_f_6_b, :c_f_7_b, :c_f_8_b, :c_f_9_t, :email, :event_setup_form_id, :first_name, :last_name, :notes, :phone_number, :receive_emails, :sex


  validates  :first_name,  :presence => {:message => 'Must enter a first name'}
  validates  :last_name,  :presence => {:message => 'Must enter a last name'}
  validates_format_of :email, :with => /.+@.+\..+/i,  :presence => {:message => 'Must enter a email address'}



belongs_to :event_setup_forms, :inverse_of => :event_forms

end


