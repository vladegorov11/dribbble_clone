require 'will_paginate/array'
class ApplicationController < ActionController::Base
	include Pundit
  before_action :set_locale
  protect_from_forgery with: :exception

  rescue_from ActiveRecord::RecordNotFound, with: :render_404
  rescue_from ActionController::RoutingError, with: :render_404
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  
  def render_404
  	render :file => "#{Rails.root}/public/404.html",  :status => 404
  end

  private

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options(options={})
      {locale: I18n.locale}.merge options
  end

  def user_not_authorized
   flash[:alert] = "You are not authorized to perform this action."
   redirect_to(request.referrer || root_path)
  end
end
