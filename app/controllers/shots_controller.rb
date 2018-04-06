class ShotsController < ApplicationController
  before_action :set_shot, only: [:show, :edit, :update, :destroy, :like, :unlike]
  before_action :authenticate_user!, only: [:edit, :update, :destroy]
  impressionist actions: [:show], unique: [:impressionable_type, :impressionable_id, :session_hash]

  def index
    @shots = SearchFilter.new(params).scope.current_page(params[:page])
  end

  def show
  end

  def new
    @shot = current_user.designer.shots.build
  end

  def edit
  end

  def create
    @shot = current_user.designer.shots.build(shot_params)
    respond_to do |format|
      if @shot.save
        format.html { redirect_to @shot, notice: 'Shot was successfully created.' }
        format.json { render :show, status: :created, location: @shot }
      else
        format.html { render :new }
        format.json { render json: @shot.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @shot.update(shot_params)
        format.html { redirect_to @shot, notice: 'Shot was successfully updated.' }
        format.json { render :show, status: :ok, location: @shot }
      else
        format.html { render :edit }
        format.json { render json: @shot.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @shot.destroy
    respond_to do |format|
      format.html { redirect_to shots_url, notice: 'Shot was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def like
    @shot.like_by current_user
    respond_to do |format|
      format.html {redirect_back fallback_location: root_path}
      format.js {render layout:false}
    end
  end

  def unlike
    @shot.unliked_by current_user
    respond_to do |format|
      format.html {redirect_back fallback_location: root_path}
      format.js {render layout:false}
    end
  end
  private

    def set_shot
      @shot = Shot.find(params[:id])
    end

    def shot_params
      params.require(:shot).permit(:title, :description, :user_shot, :all_tags)
    end
end
