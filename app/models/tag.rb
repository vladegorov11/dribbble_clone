class Tag < ApplicationRecord

  has_many :taggings
  has_many :shots, through: :taggings

  scope :shot_count, -> { includes(:shots).sort_by {|tag| tag.shots.size }.reverse }

end
