class TagsController < ApplicationController

	def show
		@tag = Tag.find_by(name: params[:id])
    @shots = @tag.shots.current_page(params[:page])
	end
	
end