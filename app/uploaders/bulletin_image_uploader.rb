class  BulletinImageUploader < CarrierWave::Uploader::Base
  include CarrierWaveDirect::Uploader
   #require 'carrierwave/processing/mini_magick'
  include CarrierWave::RMagick

  # Include the Sprockets helpers for Rails 3.1+ asset pipeline compatibility:
  include Sprockets::Helpers::RailsHelper
  include Sprockets::Helpers::IsolatedHelper

  include CarrierWave::MimeTypes
  # process :set_content_type
  # 
  #  
  #          version :main do
  #            process :resize_first_page
  #            process :convert => :jpg
  #            process :set_content_type
  #          end
  # 
  #          version :cropped do
  #            process :resize_to_fill => [275, 500, Magick::NorthWestGravity]
  #            process :convert => :jpg
  #            process :set_content_type
  #          end
  #          
  #          version :thumb, :from_version => :cropped do
  #             process resize_to_fill: [137, 250]
  #           end
  # 
  # 
  #          private
  #          
  # 
  #        
  #          
  #          
  #          def resize_first_page
  #            manipulate! do |pdff|
  #              first_page = Magick::ImageList.new("#{current_path}[0]").first
  #              thumb = first_page.resize_to_fill!(1346,612)
  #              thumb
  #            end
  #          end
  # 
  #          def set_content_type(*args)
  #            self.file.instance_variable_set(:@content_type, "image/jpg")
  #          end
          
         end