class Skill < ApplicationRecord
	include PgSearch
  has_many :abilities
  has_many :designers, through: :abilities
  pg_search_scope :search_everywhere, against: [:name]
end
