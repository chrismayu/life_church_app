class ChurchStaff < ActiveRecord::Base
  include Tokenable
  attr_accessible :contact_email, :birth_location, :email_id, :birthday, :blog, :url, :phone_ext, :phone_number, :category, :twitter, :full_name, :facebook, :blog, :google_plus, :linked_in,   :rank, :description, :first_name, :image, :last_name, :spouse_first_name, :started_service, :title
  resourcify
has_many :staff_ranks, :foreign_key => :ranking, :primary_key =>  :rank
has_many :church_staff_pictures, :foreign_key => :church_staff_id, :primary_key =>  :id, :inverse_of => :church_staff, :dependent => :destroy



validates  :first_name,  :presence => {:message => 'Must enter a first name'}
validates  :last_name,  :presence => {:message => 'Must enter a last name'}

 #validates :date_of_birth, :presence => true
validates :description,  length: { maximum: 240 }

 


  
 #validates_formatting_of :email, :using => :simple_email, :message => "Invalid Email"
 validates_format_of :contact_email, :with => /.+@.+\..+/i



 

 default_scope order: 'church_staffs.rank ASC'
 default_scope order: 'church_staffs.last_name ASC'
 
 
 before_save :combine_first_and_last_name

 private 

 def combine_first_and_last_name
    full_name = "#{self.first_name} #{self.last_name}" 
    self.full_name = full_name
 end

 
end



 