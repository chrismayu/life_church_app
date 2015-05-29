class Faq < ActiveRecord::Base 
  attr_accessible :admin, :answer, :member_only, :title, :user_id, :the_answer, :editor
  has_many :answers
  
  
  validates :the_answer, presence: true
  validates :title, presence: true, length: { maximum: 240 }
  
#  scope :current, -> { where("starts_at <= :now and ends_at >= :now", now: Time.zone.now) }
  #scope :featured_order, order('(case when editor then 1 else 0 end) DESC, created_at DESC')
  
  scope :editor, where(admin: false)
  scope :non_members, where(admin: false ,editor: false, member_only: false )
  scope :members, where(admin: false ,editor: false )
  
end
