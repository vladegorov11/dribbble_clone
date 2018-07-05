class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many  :conversations, :foreign_key => :sender_id
  has_one		:designer, dependent: :destroy
  has_many	:comments, dependent: :destroy
  has_many 	:follows
  has_many 	:designers, through: :follows
  has_many  :reports
  has_and_belongs_to_many  :roles
  acts_as_voter

  #after_commit :set_default_role

  def all_unread_messages
    message_count = 0 
    self.conversations.each do |conv| 
      message_count += conv.messages.where('read = ? ', false).where("user_id != ?",self.id ).count
    end 
    return message_count
  end

  def designer?
    self.designer.present?
  end
  #role methods start 
  def add_role(role)
    self.roles.push(role) 
  end

  def remove_role(role) 
    self.roles.delete(role)
  end 

  def set_default_role 
    self.roles.push(Role.find_by(name: 'user'))
  end 

  def admin?
  	 check_role(self, "admin")
  end

  def user? 
  	check_role(self, "user")
  end

  def vip? 
  	check_role(self, "vip")
  end
  #role methods end 
  
  private 

  def check_role(user, role_name)
    user.roles.map(&:name).include?(role_name)
  end
  
end



