class State < ActiveRecord::Base
  belongs_to :country
  has_many :users
  
  attr_accessible :country_id, :name
  
end
