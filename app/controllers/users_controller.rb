class UsersController < ApplicationController
  layout 'user'

  def index
    @users= User.all
  end
end
