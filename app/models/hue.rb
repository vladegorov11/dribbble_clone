class Hue < ApplicationRecord
	has_many :shot_hues 
  has_many :shots, through: :shot_hues 
end
