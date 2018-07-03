class NotificationsController < Notifications::ApplicationController
  before_action :authenticate_user!
  layout 'designer.html.erb' 

  def index
    @designer = current_user.designer
    @notifications = notifications.includes(:actor, :target, :second_target).order('id desc').paginate(:page => params[:page], :per_page => 5)
    unread_ids = @notifications.reject(&:read?).select(&:id)
    Notification.read!(unread_ids)
    @notification_groups = @notifications.group_by { |note| note.created_at.to_date }
  end

  def destroy
    notifications.delete_all
    redirect_to notifications_path
  end

  private

  def notifications
    Notification.where(user_id: current_user.id)
  end
  end

