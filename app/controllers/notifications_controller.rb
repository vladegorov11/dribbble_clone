class NotificationsController < Notifications::ApplicationController
  before_action :authenticate_user!
  layout 'designer' 
  before_action :find_notification, only: :destroy 
  def index
    @designer = current_user.designer
    @notifications = notifications.includes(:actor, :target, :second_target).order('id desc').paginate(:page => params[:page], :per_page => 5)
    unread_ids = @notifications.reject(&:read?).select(&:id)
    Notification.read!(unread_ids)
    @notification_groups = @notifications.group_by { |note| note.created_at.to_date }
  end

  def destroy
    @notification.destroy 
    respond_to do |format|
      format.html { redirect_to notifications_path, notice: 'notification was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def destroy_all
    notifications.delete_all
    redirect_to notifications_path
  end

  private

  def find_notification
    @notification = Notification.find(params[:id])
  end

  def notifications
    Notification.where(user_id: current_user.id)
  end

  end

