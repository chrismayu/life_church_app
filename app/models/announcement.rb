class Announcement < ActiveRecord::Base
  attr_accessible :ends_at, :message, :starts_at, :colours
  
  scope :current, -> { where("starts_at <= :now and ends_at >= :now", now: Time.zone.now) }
  
  validates :message, presence: true, length: { maximum: 200 }
  
  validates_datetime :starts_at
  validates_datetime :ends_at, :after => :starts_at, :after_message => 'must be before "Start Time"'
  
  
  
  def self.current(hidden_ids = nil)
    result = where("starts_at <= :now and ends_at >= :now", now: Time.zone.now)
    result = result.where("id not in (?)", hidden_ids) if hidden_ids.present?
    result
  end
end
