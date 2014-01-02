class Ministry < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :history
  
  attr_accessible  :advert_main_page, :contact_email, :contact_person, :description, :display_rank, :name, :ta1, :ta2, :ta3, :ta4, :ta5

  has_many :ministry_pictures, :foreign_key => :ministry_id, :primary_key =>  :id, :inverse_of => :ministry, :dependent => :destroy
  has_many :ministry_children, :foreign_key => :ministry_id, :primary_key =>  :id, :inverse_of => :ministry, :dependent => :destroy
  
  after_validation :move_friendly_id_error_to_name

    def move_friendly_id_error_to_name
      errors.add :name, *errors.delete(:friendly_id) if errors[:friendly_id].present?
    end
   

end
