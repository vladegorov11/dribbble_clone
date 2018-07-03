class Role < ApplicationRecord
	has_and_belongs_to_many  :users
	ROLE_NAMES = %w[
		admin
		user
		vip
		].freeze

	validates :name, inclusion: {in: ROLE_NAMES}, presence: true, uniqueness: true
end
