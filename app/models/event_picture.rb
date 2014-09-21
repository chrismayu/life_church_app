class EventPicture < ActiveRecord::Base
  attr_accessible :event_image, :event_id, :eventimage, :image_processed, :linked_event, :title
     mount_uploader :event_image, EventImageUploader
   
   belongs_to :event, :inverse_of => :event_pictures
 

 
     after_create :enqueue_image

     def image_name
       File.basename(event_image.path || event_image.filename) if event_image
     end

     def enqueue_image
        perform(id, key) if key.present?
     end



       def perform(id, key)
         eventpicture = EventPicture.find(id)
         eventpicture.key = key
         eventpicture.remote_event_image_url = eventpicture.event_image.direct_fog_url(with_path: true)
         eventpicture.save!
         eventpicture.update_column(:image_processed, true)
       end
  
end


