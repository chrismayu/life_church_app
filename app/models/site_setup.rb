class SiteSetup < ActiveRecord::Base
  attr_accessible :articles, :facebook, :leaders_blog, :life_pulse, :shutdown, :store, :twitter, :video, :video_stream, :youtube
end
