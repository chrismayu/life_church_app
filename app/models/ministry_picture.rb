class MinistryPicture < ActiveRecord::Base
  attr_accessible :image_processed, :ministries_id, :ministry_image
  mount_uploader :ministry_image, MinistryImageUploader
  belongs_to :ministry, :inverse_of => :ministry_pictures


 
     after_create :enqueue_image

     def image_name
       File.basename(ministry_image.path || ministry_image.filename) if ministry_image
     end

     def enqueue_image
        perform(id, key) if key.present?
     end



       def perform(id, key)
         ministrypicture = MinistryPicture.find(id)
         ministrypicture.key = key
         ministrypicture.remote_ministry_image_url = ministrypicture.ministry_image.direct_fog_url(with_path: true)
         ministrypicture.save!
         ministrypicture.update_column(:image_processed, true)
       end
end
