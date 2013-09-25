class EventPicture < ActiveRecord::Base
  attr_accessible :event_image, :linked_event, :title
end
