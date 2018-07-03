class Card < ApplicationRecord
	
	belongs_to :designer 

	 validates :number , presence: true , length: { is: 16 } , format: { with: /\d/,
    message: "only numerals" }
	 validates :month , presence: true, length: { is: 2 }
	 validates :year  , presence: true, length: { is: 4 }
	 validates :cvv , presence: true, length: { is: 3 }
end
