class Admin::AdminController < ApplicationController
  before_action :authenticate_user!
  layout 'admin.html.erb'

  # rescue_from CanCan::AccessDenied do |exeption|
  #   redirect_to root_path , danger: "Страница не существует "
  # end

  # protected

  # def check_admin
  #   authorize! :manage, :all
  # end
end