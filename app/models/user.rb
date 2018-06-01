class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :conversations, :foreign_key => :sender_id
  has_one		:designer, dependent: :destroy
  has_many		:comments, dependent: :destroy
  has_many 		:follows
  has_many 		:designers, through: :follows
  has_many  :reports
  has_and_belongs_to_many  :roles
  acts_as_voter

  #after_create	:default_role

 

  def admin?
  	 check_role(self, "admin")
  end

  def user? 
  	check_role(self, "user")
  end

  def vip? 
  	check_role(self, "vip")
  end

  private 

  def check_role(user, role_name)
    user.roles.map(&:name).include?(role_name)
  end
  
end
