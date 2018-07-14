class Tag < ApplicationRecord
	include PgSearch
  has_many :taggings
  has_many :shots, through: :taggings

  scope :shot_count, -> { includes(:shots).sort_by {|tag| tag.shots.size }.reverse }
  pg_search_scope :search_everywhere, against: [:name]
end
