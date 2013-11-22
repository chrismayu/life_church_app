class SermonPicture < ActiveRecord::Base
  attr_accessible :image_processed, :sermon_image, :sermons_id
  mount_uploader :sermon_image, SermonImageUploader
  belongs_to :sermon, :inverse_of => :sermon_pictures


 
     after_create :enqueue_image

     def image_name
       File.basename(sermon_image.path || sermon_image.filename) if sermon_image
     end

     def enqueue_image
        perform(id, key) if key.present?
     end



       def perform(id, key)
         sermonpicture = SermonPicture.find(id)
         sermonpicture.key = key
         sermonpicture.remote_sermon_image_url = sermonpicture.sermon_image.direct_fog_url(with_path: true)
         sermonpicture.save!
         sermonpicture.update_column(:image_processed, true)
       end
end
