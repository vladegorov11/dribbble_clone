class Follow < ApplicationRecord
  belongs_to :user
  belongs_to :designer

  after_commit :create_notifications, on: [:create]

  def create_notifications
  	puts self.inspect
    Notification.create(
      notify_type: 'follow',
      actor: self.user,
      user: self.designer.user,
      target: self.designer)
  end

end
