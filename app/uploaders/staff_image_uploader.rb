class StaffImageUploader < CarrierWave::Uploader::Base
  include CarrierWaveDirect::Uploader
  
  #include CarrierWave::RMagick
  include CarrierWave::MiniMagick
  # Include the Sprockets helpers for Rails 3.1+ asset pipeline compatibility:
  include Sprockets::Helpers::RailsHelper
  include Sprockets::Helpers::IsolatedHelper

  include CarrierWave::MimeTypes
  process :set_content_type

  version :main do
    process resize_to_fill: [220, 205]
  end

  version :thumb do
    process resize_to_fill: [220, 205]
  end
  
  version :stamp do
    process resize_to_fill: [150, 140]
  end
end