class ShotsController < ApplicationController
  before_action :set_shot, only: [:show, :edit, :update, :destroy, :like, :unlike]
  before_action :authenticate_user!, except: [:index, :show]
  impressionist actions: [:show], unique: [:impressionable_type, :impressionable_id, :session_hash]
  before_action :check_designer_shot_count, only: [:create, :new]

  def index
    begin
      @shots = Shot.filter(params.slice(:sort, :date, :list).permit!).current_page(params[:page]) 
      authorize @shots
      @empty_record = false
    rescue Exception => e
      @empty_record = true
    end
  end

  def show
    authorize @shot
  end

  def new
    @shot = current_user.designer.shots.build
    authorize @shot
  end

  def edit
    authorize @shot
  end

  def create
    @shot = current_user.designer.shots.build(shot_params)
    authorize @shot
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
    authorize @shot
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
    authorize @shot
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

  def search
    @designers = Designer.all
    @shots = Shot.search_everywhere(params[:query]).current_page(params[:page]) 
  end
  
  private

    def check_designer_shot_count
      if current_user.designer.shots.count >= 10 
        flash[:alert] = "you post count > 10. Bay Vip account and хуярь сколько угодно постов"
        redirect_to(request.referrer || root_path)
      end
    end

    def set_shot
      @shot = Shot.find(params[:id]) 
    end

    def shot_params
      params.require(:shot).permit(:title, :description, :user_shot, :all_tags, :status)
    end
end
