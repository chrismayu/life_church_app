class Video < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :history
  
  attr_accessible :_email, :advert_main_page, :contact, :contact_person, :description, :display_rank, :name, :ta1, :ta2, :ta3, :ta4, :ta5, :title, :url


  after_validation :move_friendly_id_error_to_name

    def move_friendly_id_error_to_name
      errors.add :name, *errors.delete(:friendly_id) if errors[:friendly_id].present?
    end
   


end
