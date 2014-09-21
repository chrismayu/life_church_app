class Program < ActiveRecord::Base
  extend FriendlyId
  friendly_id :program_name, use: :history
  attr_accessible :contact_email, :contact_person, :slug, :description, :display_main_page, :location, :program_name, :remove_program_date

  belongs_to :event, :inverse_of => :programs
 
  after_validation :move_friendly_id_error_to_name
  
 # validates :description, presence: true, length: { maximum: 140 }

 
 
  #validates_format_of :contact_email, :with => /.+@.+\..+/i


 
  
  
  def move_friendly_id_error_to_name
    errors.add :program_name, *errors.delete(:friendly_id) if errors[:friendly_id].present?
  end
   
   
   
   
end
