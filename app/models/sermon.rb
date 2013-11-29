class Sermon < ActiveRecord::Base
  attr_accessible :audio_url, :category, :date_of_sermon, :description, :display_until, :members_only, :speaker_id, :title, :url, :video_url
resourcify
belongs_to :speaker
has_many :sermon_pictures, :foreign_key => :sermons_id, :primary_key =>  :id, :inverse_of => :sermon, :dependent => :destroy


default_scope order: 'sermons.date_of_sermon ASC'
 
end
