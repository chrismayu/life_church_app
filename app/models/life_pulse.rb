class LifePulse < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :history
  attr_accessible :content, :flickr_id, :from_pastor_desk, :keywords, :summary, :template_selected, :title
  

  has_many :life_pulse_pictures, :foreign_key => :life_pulse_id, :primary_key =>  :id, :inverse_of => :life_pulse, :dependent => :destroy

  validates  :title, :presence => true
  validates  :summary, :presence => true 
 

  after_validation :move_friendly_id_error_to_name

    def move_friendly_id_error_to_name
      errors.add :title, *errors.delete(:friendly_id) if errors[:friendly_id].present?
    end
   
   
   
  
   

end
