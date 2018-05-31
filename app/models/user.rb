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
  acts_as_voter

  after_create	:default_role

  def default_role
  	self.update(role: 'user')	
  end

  def admin?
  	self.role == 'admin'
  end

  def user? 
  	self.role == 'user'
  end

  def role? 
  	self.role 
  end
end
