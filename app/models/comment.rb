class Comment < ApplicationRecord

  belongs_to :user
  belongs_to :shot, :counter_cache => true
  has_many :reports, as: :reportable
  acts_as_votable

  validates :response, presence: true,  length: { in: 2..1000 }

  after_commit :create_notifications, on: [:create]

  def create_notifications
    Notification.create(
      notify_type: 'comment',
      actor: self.user,
      user: self.shot.designer.user,
      target: self,
      second_target: self.shot)
  end


    # t.string "name"
    # t.text "response"
    # t.integer "shot_id"
    # t.integer "user_id"

end
