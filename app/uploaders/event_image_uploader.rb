class EventImageUploader < CarrierWave::Uploader::Base
  include CarrierWaveDirect::Uploader
  
  include CarrierWave::RMagick

  # Include the Sprockets helpers for Rails 3.1+ asset pipeline compatibility:
  include Sprockets::Helpers::RailsHelper
  include Sprockets::Helpers::IsolatedHelper

  include CarrierWave::MimeTypes
  process :set_content_type

  version :main do
    #process resize_to_fill: [652, 484, gravity = 'Center']
    process resize_and_pad: [652, 484, background = :transparent, gravity = 'Center']
  end
  
  version :side do
    #process resize_to_fill: [216, 150, gravity = 'Center']
     process resize_and_pad: [216, 150, background = :transparent, gravity = 'Center']  
  end

  version :thumb do
    process resize_to_fill: [200, 200, gravity = 'Center']
  end
  
  version :stamp do
    process resize_to_fill: [100, 70, gravity = 'Center']
  end
end