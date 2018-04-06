class Comment < ApplicationRecord

  belongs_to :user
  belongs_to :shot
  acts_as_votable
  
end
