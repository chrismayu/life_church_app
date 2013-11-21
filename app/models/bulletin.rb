class Bulletin < ActiveRecord::Base
  attr_accessible :advert_main_page, :bulletin_image, :description, :display_start, :display_till, :members_only, :name, :url, :crop_x, :crop_y, :crop_w, :crop_h, :original_width, :original_height
  mount_uploader :bulletin_image, BulletinImageUploader
  
   
  validates :display_start, presence: true
  
  after_create :enqueue_image  
  
  
  default_scope order: 'bulletins.display_start DESC' 
 
  
  public
  def set_display_till_date(bulletin)
    start_date = bulletin.display_start
    bulletin.display_till = bulletin.display_start + 6.days
    bulletin.display_till
  end

  private

  def image_name
    File.basename(bulletin_image.path || bulletin_image.filename) if bulletin_image
  end

  def enqueue_image
     perform(id, key) if key.present?
  end






    def perform(id, key)
      bulletin = Bulletin.find(id)
      bulletin.key = key
      bulletin.remote_bulletin_image_url = bulletin.bulletin_image.direct_fog_url(with_path: true)
      bulletin.save!
      bulletin.update_column(:image_processed, true)
    end

end
