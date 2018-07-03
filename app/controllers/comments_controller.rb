class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]
  before_action :comment_params, only: [:create]
  before_action :find_shot, only: [:create, :destroy]
  before_action :find_designer, only: [:index ]
  layout 'designer.html.erb'
  def index 
    @comments = Comment.where(shot_id: @designer.shots.ids).includes(:user, :shot)
  end 

  def create
    @comment = @shot.comments.create(comment_params)
    @comment.user_id = current_user.id if current_user 
    @comment.save!

    redirect_to shot_path(@shot)
  end

  def destroy
    @comment = @shot.comments.find(params[:id])
    @comment.destroy
    redirect_to shot_path(@shot)
  end

  private

  def get_comment
    @comment  = Comment.find(params[:id])
  end

  def find_shot
    @shot  = Shot.find(params[:shot_id])
  end

  def comment_params
    params.require(:comment).permit( :response)
  end

  def find_designer 
    if current_user.designer.id == params[:designer_id].to_i
      @designer = Designer.find(params[:designer_id])
    else 
      @designer = Designer.find(current_user.designer.id)
    end
  end
end
