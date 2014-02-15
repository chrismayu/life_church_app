class LifePulse < ActiveRecord::Base
  include ActionView::Helpers::TextHelper
  extend FriendlyId
  friendly_id :title, use: :history
  attr_accessible :content, :flickr_id, :from_pastor_desk, :keywords, :summary, :template_selected, :title
  

  has_many :life_pulse_pictures, :foreign_key => :life_pulse_id, :primary_key =>  :id, :inverse_of => :life_pulse, :dependent => :destroy
  
  belongs_to :life_pulse_stock_pictures
   
  validates  :title, :presence => true
  validates  :summary, presence: true, length: { maximum: 140 }
 
  after_save :create_keyword

  after_validation :move_friendly_id_error_to_name

    def move_friendly_id_error_to_name
      errors.add :title, *errors.delete(:friendly_id) if errors[:friendly_id].present?
    end
   
   
   
    def self.search(search)
      if search
        find(:all, :conditions => ['keywords LIKE ?', "%#{search}%"])
      else
        find(:all)
      end
    end
   
   
   
    private

       def create_keyword
           life_pulse = LifePulse.find(id)
           keyword = "#{pastor_desk(life_pulse.from_pastor_desk)} #{life_pulse.created_at.strftime("%B, %b, %m, %A, %a, %d, %Y") } #{life_pulse.summary} #{life_pulse.keywords}  #{life_pulse.title} #{life_pulse.created_at.strftime("%B #{life_pulse.created_at.day.ordinalize}, %Y") }"
           truncated_keyword =  truncate(keyword, :length => 250)  
           life_pulse.update_column(:keywords, truncated_keyword)
       end
       
       def pastor_desk(pastor)
         
         if from_pastor_desk?
           pastor = "From the Pastor's Desk"
         end
         
         return pastor
         
      end   
 
  
   
   

end
