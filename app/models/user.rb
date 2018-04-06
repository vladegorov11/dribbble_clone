class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one                 :designer, dependent: :destroy
  has_many                :comments, dependent: :destroy
  acts_as_voter

  has_many :follows
  has_many :designers, through: :follows
end
