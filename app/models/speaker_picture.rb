class SpeakerPicture < ActiveRecord::Base
  attr_accessible :image_processed, :speaker_id, :speaker_image
     mount_uploader :speaker_image, SpeakerImageUploader
     
  belongs_to :speaker, :inverse_of => :speaker_pictures


 
     after_create :enqueue_image

     def image_name
       File.basename(speaker_image.path || speaker_image.filename) if speaker_image
     end

     def enqueue_image
        perform(id, key) if key.present?
     end



       def perform(id, key)
         speakerpicture = SpeakerPicture.find(id)
         speakerpicture.key = key
         speakerpicture.remote_speaker_image_url = speakerpicture.speaker_image.direct_fog_url(with_path: true)
         speakerpicture.save!
         speakerpicture.update_column(:image_processed, true)
       end
  
end
