class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  scope :current_page, -> (page) do
    paginate(:page => page, :per_page => per_page)
  end

  def destroy_notifications
  	Notification.where("target_id = ? AND target_type = ?", self.id , self.class).delete_all
  end

end
