class SiteSetup < ActiveRecord::Base
  attr_accessible :articles, :facebook, :approval, :general_questions, :contact, :leaders_blog, :life_pulse, :shutdown, :store, :twitter, :video, :video_stream, :youtube
end

 