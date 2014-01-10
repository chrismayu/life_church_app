class LifePulsePicture < ActiveRecord::Base
  attr_accessible :image_processed, :life_pulse_id, :life_pulse_image, :main_page, :summary, :title

  mount_uploader :life_pulse_image, LifePulseImageUploader
  belongs_to :life_pulse, :inverse_of => :life_pulse_pictures



   after_create :enqueue_image

   def image_name
     File.basename(life_pulse_image.path || life_pulse_image.filename) if life_pulse_image
   end

   def enqueue_image
      perform(id, key) if key.present?
   end



     def perform(id, key)
       life_pulsepicture = LifePulsePicture.find(id)
       life_pulsepicture.key = key
       life_pulsepicture.remote_life_pulse_image_url = life_pulsepicture.life_pulse_image.direct_fog_url(with_path: true)
       life_pulsepicture.save!
       life_pulsepicture.update_column(:image_processed, true)
     end




end
