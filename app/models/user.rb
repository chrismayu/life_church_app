class User < ActiveRecord::Base
  rolify
 
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :role_ids, :as => :admin
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me, :approved
  
  #after_create :send_admin_mail, :assign_default_role

  
  
  def active_for_authentication?
            super && approved?
          end
        
  def inactive_message
                  
    if !approved?
        :not_approved
    else
     super "Good to go"
    end
  end        
     
  def assign_default_role
    add_role(:member)
  end
       
  def send_admin_mail
    AdminMailer.new_user_waiting_for_approval(self).deliver
  end
  
  
  def self.send_reset_password_instructions(attributes={})
    recoverable = find_or_initialize_with_errors(reset_password_keys, attributes, :not_found)
    if !recoverable.approved?
      recoverable.errors[:base] << I18n.t("devise.failure.not_approved")
    elsif recoverable.persisted?
      recoverable.send_reset_password_instructions
    end
    recoverable
  end
  
end
