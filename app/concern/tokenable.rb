module Tokenable
  extend ActiveSupport::Concern

  included do
    before_create :generate_church_staff_email_id
  end

  protected

  def generate_church_staff_email_id
    self.email_id = loop do 
       random_church_staff_email_id = SecureRandom.hex(2)
      break random_church_staff_email_id unless ChurchStaff.where(email_id: random_church_staff_email_id).exists?
    end
  end
end