class EventSetupForm < ActiveRecord::Baserequire "event_form"

  attr_accessible :age, :bday, :c_f_1, :c_f_10, :c_f_10_h, :c_f_11, :c_f_11_h, :c_f_12, :c_f_12_h, :c_f_1_h, :c_f_2, :c_f_2_h, :c_f_3, :c_f_3_h, :c_f_4, :c_f_4_h, :c_f_5, :c_f_5_h, :c_f_6, :c_f_6_h, :c_f_7, :c_f_7_h, :c_f_8, :c_f_8_h, :c_f_9, :c_f_9_h, :down_link, :email_for_forms, :event_id, :form_title, :note, :ok_to_contact, :phone, :sex, :use_form

  has_many :event_forms, :foreign_key => :event_setup_forms_id, :primary_key =>  :id, :inverse_of => :event_setup_forms, :dependent => :destroy

  belongs_to :event, :inverse_of => :event_setup_forms

end
