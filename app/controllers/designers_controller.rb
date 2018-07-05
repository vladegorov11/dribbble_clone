class DesignersController < ApplicationController
  layout 'designer', except: [:index, :edit, :new, :create, :update]
  before_action :set_designer, only: [:show, :edit, :update, :destroy, :follow, :unfollow]
  before_action :authenticate_user!, only: [:edit, :update, :destroy, :follow, :unfollow]
  def index
    @designers = Designer.includes(:shots)
    authorize @designers
  end

  def show
    authorize @designer
    @shots = @designer.shots.current_page(params[:page])
  end

  def new
    @designer = current_user.build_designer
  end

  def edit
    authorize @designer
  end

  def create
    @designer = current_user.build_designer(designer_params)
    respond_to do |format|
      if @designer.save
        format.html { redirect_to @designer, notice: 'Designer was successfully created.' }
        format.json { render :show, status: :created, location: @designer }
      else
        format.html { render :new }
        format.json { render json: @designer.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    authorize @designer
    respond_to do |format|
      if @designer.update(designer_params)
        format.html { redirect_to @designer, notice: 'Designer was successfully updated.' }
        format.json { render :show, status: :ok, location: @designer }
      else
        format.html { render :edit }
        format.json { render json: @designer.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    authorize @designer
    @designer.destroy
    respond_to do |format|
      format.html { redirect_to designers_url, notice: 'Designer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def follow
    authorize @designer
    @designer.follow(current_user)
    redirect_back(fallback_location: root_path)
  end

  def unfollow
    authorize @designer
    @designer.unfollow(current_user)
    redirect_back(fallback_location: root_path)
  end

  def likers
    @likers = Shot.find_by(designer_id: 2).impressions
  end

  def followers
    @designer = current_user.designer
    @follows = current_user.designer.followers
  end

  private
  
    def set_designer
      @designer = Designer.find(params[:id])
    end

    def designer_params
      params.require(:designer).permit(:name, :description, :all_skills, :city, :phone,
       :instagram_link, :facebook_link, :twitter_link, cards_attributes: [:id, :number, :year, :month, :cvv, :_destroy])
    end
end
