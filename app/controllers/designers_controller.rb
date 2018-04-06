class DesignersController < ApplicationController
  before_action :set_designer, only: [:show, :edit, :update, :destroy, :follow, :unfollow]
  before_action :authenticate_user!, only: [:edit, :update, :destroy, :follow, :unfollow]

  def index
    @designers = Designer.includes(:shots)
  end

  def show
    @shots = @designer.shots
  end

  def new
    @designer = current_user.build_designer
  end

  def edit
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
    @designer.destroy
    respond_to do |format|
      format.html { redirect_to designers_url, notice: 'Designer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def follow
    @designer.follow(current_user)
    redirect_back(fallback_location: root_path)
  end

  def unfollow
    @designer.unfollow(current_user)
    redirect_back(fallback_location: root_path)
  end
  private

    def set_designer
      @designer = Designer.find(params[:id])
    end

    def designer_params
      params.require(:designer).permit(:name, :description, :all_skills)
    end
end
