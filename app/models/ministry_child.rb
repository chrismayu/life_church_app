class MinistryChild < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :history
  
  
  attr_accessible :advert_main_page, :contact_email, :ministry_id, :contact_person, :description, :display_rank, :name, :ta1, :ta2, :ta3, :ta4, :ta5

  belongs_to :ministry, :inverse_of => :ministry_children
  
  has_many :ministry_picture_children, :foreign_key => :ministry_id, :primary_key =>  :id, :inverse_of => :ministry_child, :dependent => :destroy
   
  validates :description, presence: true, length: { maximum: 140 }

 validates :display_rank, presence: true
 
  # validates_format_of :contact_email, :with => /.+@.+\..+/i



 
  default_scope order: 'ministry_children.display_rank ASC' 
 
  after_validation :move_friendly_id_error_to_name

    def move_friendly_id_error_to_name
      errors.add :name, *errors.delete(:friendly_id) if errors[:friendly_id].present?
    end
   
 

end
