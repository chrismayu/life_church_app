class ChurchStaff < ActiveRecord::Base
  attr_accessible :contact_email, :birth_location, :category,:twitter, :facebook, :blog, :google_plus, :linked_in,   :rank, :description, :first_name, :image, :last_name, :spouse_first_name, :started_service, :title

has_many :staff_ranks, :foreign_key => :ranking, :primary_key =>  :rank


 default_scope order: 'church_staffs.rank ASC'
 default_scope order: 'church_staffs.last_name ASC'
 
end


