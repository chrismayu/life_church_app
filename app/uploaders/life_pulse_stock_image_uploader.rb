class LifePulseStockImageUploader < CarrierWave::Uploader::Base
  include CarrierWaveDirect::Uploader
  include CarrierWave::MiniMagick
  #include CarrierWave::RMagick

  # Include the Sprockets helpers for Rails 3.1+ asset pipeline compatibility:
  include Sprockets::Helpers::RailsHelper
  include Sprockets::Helpers::IsolatedHelper

  include CarrierWave::MimeTypes
  process :set_content_type

 

  version :thumb do
    process resize_to_fill: [200, 200 ]
  end
  
  version :stamp do
    process resize_to_fill: [100, 70 ]
  end
end