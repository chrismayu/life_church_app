class Sermon < ActiveRecord::Base
  attr_accessible :audio_url, :category, :date_of_sermon, :description, :display_until, :members_only, :speaker_id, :title, :url, :video_url

belongs_to :speaker
 
end
