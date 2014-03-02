class State < ActiveRecord::Base
  belongs_to :country
  has_many :user
  
  attr_accessible :country_id, :name
  
end
