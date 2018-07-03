class Report < ApplicationRecord
	belongs_to :user
	belongs_to :reportable, polymorphic: true
	belongs_to :report_type
	validates  :body, presence: true
end
