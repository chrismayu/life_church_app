class Answer < ActiveRecord::Base
  attr_accessible :admin, :answer, :faq_id, :member_only, :title, :user_id
  belongs_to :faq
end
