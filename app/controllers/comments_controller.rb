class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]
  before_action :comment_params, only: [:create]
  before_action :find_shot, only: [:create, :destroy,:like, :unlike]
  
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

  def get_commet
    @comment  = Comment.find(params[:id])
  end

  def find_shot
    @shot  = Shot.find(params[:shot_id])
  end

  def comment_params
    params.require(:comment).permit(:name, :response)
  end
end
