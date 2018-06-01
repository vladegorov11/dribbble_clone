class Comment < ApplicationRecord

  belongs_to :user
  belongs_to :shot, :counter_cache => true
  has_many :reports, as: :reportable
  acts_as_votable

  validates :response, presence: true,  length: { in: 2..1000 }



    # t.string "name"
    # t.text "response"
    # t.integer "shot_id"
    # t.integer "user_id"

end
