class Schedule < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :history
 
 
  attr_accessible :description, :end_month, :image_processed, :name, :schedule_image, :slug, :start_month, :url
 
  
  mount_uploader :schedule_image, ScheduleImageUploader
    resourcify
   
  validates :start_month, presence: true

  before_save :create_name
  after_create :enqueue_image, :set_end_month_date    
  
  
  default_scope order: 'schedules.start_month DESC' 
  
 
   
  after_validation :move_friendly_id_error_to_name

    def move_friendly_id_error_to_name
      errors.add :name, *errors.delete(:friendly_id) if errors[:friendly_id].present?
    end
   
  
 
  public
 

  
  
  def create_name 
   self.name = "Week of  #{self.start_month.strftime("%B #{self.start_month.day.ordinalize}, %Y")}" 
   
   end

  private
  
  def set_end_month_date 
    start_date = self.start_month
    self.end_month = self.start_month + 4.months
    self.end_month
  end
  
  

  def image_name
    File.basename(schedule_image.path || schedule_image.filename) if schedule_image
  end

  def enqueue_image
     perform(id, key) if key.present?
  end

 
    def perform(id, key)
      schedule = Schedule.find(id)
      schedule.key = key
      schedule.remote_schedule_image_url = schedule.schedule_image.direct_fog_url(with_path: true)
      schedule.save!
      schedule.update_column(:image_processed, true)
    end



  end