class StaffRank < ActiveRecord::Base
  attr_accessible :category, :ranking
  
  belongs_to :church_staff, :foreign_key => :rank, :primary_key =>  :ranking
end
