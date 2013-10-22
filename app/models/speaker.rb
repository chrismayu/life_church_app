class Speaker < ActiveRecord::Base
  attr_accessible :church_staff_id, :description, :first_name, :from_church, :from_church_url, :last_name, :title

  has_many :speaker_pictures, :foreign_key => :speaker_id, :primary_key =>  :id, :inverse_of => :speaker, :dependent => :destroy
  has_many :sermons

end
