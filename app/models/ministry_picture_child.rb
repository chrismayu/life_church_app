class MinistryPictureChild < ActiveRecord::Base
  attr_accessible :image_processed, :ministrychild_id, :ministry_id, :ministrychild_image
  
  mount_uploader :ministrychild_image, MinistrychildImageUploader
  belongs_to :ministry_child, :inverse_of => :ministry_picture_children
 
     after_create :enqueue_image

     def image_name
       File.basename(ministrychild_image.path || ministrychild_image.filename) if ministrychild_image
     end

     def enqueue_image
        perform(id, key) if key.present?
     end



       def perform(id, key)
         ministrychildpicture = MinistryPictureChild.find(id)
         ministrychildpicture.key = key
         ministrychildpicture.remote_ministrychild_image_url = ministrychildpicture.ministrychild_image.direct_fog_url(with_path: true)
         ministrychildpicture.save!
         ministrychildpicture.update_column(:image_processed, true)
       end
  
  
end
