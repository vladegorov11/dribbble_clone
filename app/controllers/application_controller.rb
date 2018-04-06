class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include Pundit
  protect_from_forgery

  rescue_from ActiveRecord::RecordNotFound, :with => :render_404
  rescue_from ActionController::RoutingError, :with => :render_404

  def render_404
  	redirect_to :file => "#{Rails.root}/public/404.html",  :status => 404
  end
end
