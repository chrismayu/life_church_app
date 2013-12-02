class Sermon < ActiveRecord::Base
  attr_accessible :audio_url, :category, :date_of_sermon, :description, :display_until, :members_only, :speaker_id, :title, :url, :video_url
resourcify
belongs_to :speaker
has_many :sermon_pictures, :foreign_key => :sermons_id, :primary_key =>  :id, :inverse_of => :sermon, :dependent => :destroy


validates  :title, :presence => true
validates  :date_of_sermon, :presence => true
validates  :category, :presence => true
validates  :display_until, :presence => true
 
validates_date :date_of_sermon
validates_date :display_until, :after => :date_of_sermon, :after_message => 'must be before "Date of Sermon"'


default_scope order: 'sermons.date_of_sermon DESC'
 
end
