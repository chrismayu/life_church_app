class Faq < ActiveRecord::Base 
  attr_accessible :admin, :answer, :member_only, :title, :user_id, :the_answer, :editor
  has_many :answers
  
  
  validates :the_answer, presence: true
  validates :title, presence: true, length: { maximum: 240 }
  
  
  
end
