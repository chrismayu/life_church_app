class Ministry < ActiveRecord::Base
  attr_accessible  :advert_main_page, :contact_email, :contact_person, :description, :display_rank, :name, :ta1, :ta2, :ta3, :ta4, :ta5

  has_many :ministry_pictures, :foreign_key => :ministry_id, :primary_key =>  :id, :inverse_of => :ministry, :dependent => :destroy
  has_many :ministry_children, :foreign_key => :ministry_id, :primary_key =>  :id, :inverse_of => :ministry, :dependent => :destroy
  


end
