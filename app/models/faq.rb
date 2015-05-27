class Faq < ActiveRecord::Base 
  attr_accessible :admin, :answer, :member_only, :title, :user_id
  has_many :answers
  
end
