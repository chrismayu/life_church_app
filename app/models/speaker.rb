class Speaker < ActiveRecord::Base
  attr_accessible :church_staff_id, :description, :full_name, :first_name, :from_church, :from_church_url, :last_name, :title

  has_many :speaker_pictures, :foreign_key => :speaker_id, :primary_key =>  :id, :inverse_of => :speaker, :dependent => :destroy
  has_many :sermons
  
  
  
  before_save :combine_first_and_last_name
 
  private 

  def combine_first_and_last_name
     full_name = "#{self.first_name} #{self.last_name}" 
     self.full_name = full_name
  end

end
