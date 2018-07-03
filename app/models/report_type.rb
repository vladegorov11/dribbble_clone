class ReportType < ApplicationRecord
	has_many   :reports
	validates  :name, presence: true, length: { in: 2..200 }
end
