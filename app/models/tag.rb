class Tag < ApplicationRecord

  has_many :taggings
  has_many :shots, through: :taggings
  
end
