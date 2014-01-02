class Sermon < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :history
  attr_accessible :audio_url, :category, :date_of_sermon, :description, :display_until, :members_only, :speaker_id, :title, :url, :video_url
resourcify
belongs_to :speaker
has_many :sermon_pictures, :foreign_key => :sermons_id, :primary_key =>  :id, :inverse_of => :sermon, :dependent => :destroy


validates  :title, :presence => true
validates  :date_of_sermon, :presence => true
validates  :category, :presence => true
 

after_save :create_description

#default_scope order: 'sermons.date_of_sermon DESC'


after_validation :move_friendly_id_error_to_name

  def move_friendly_id_error_to_name
    errors.add :title, *errors.delete(:friendly_id) if errors[:friendly_id].present?
  end
   
 
def self.search(search)
  if search
    find(:all, :conditions => ['description LIKE ?', "%#{search}%"])
  else
    find(:all)
  end
end

private

   def create_description
       sermon= Sermon.find(id)
       speaker = sermon.speaker 
       sermon.update_column(:description, "#{speaker.title} #{speaker.full_name} #{sermon.date_of_sermon.strftime("%B, %b, %m, %A, %a, %d, %Y") } #{sermon.category}  #{sermon.title} #{sermon.date_of_sermon.strftime("%B #{sermon.date_of_sermon.day.ordinalize}, %Y") } yup")
   end
 
  
 
end
