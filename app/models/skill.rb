class Skill < ApplicationRecord

  has_many :abilities
  has_many :designers, through: :abilities

end
