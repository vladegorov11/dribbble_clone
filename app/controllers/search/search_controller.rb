class  Search::SearchController < ApplicationController

	def index
		# @designers = Designer.all
  #   @shots = Shot.search_everywhere(params[:query]).current_page(params[:page]) 
  		@search = Search.new([Tag.all, Shot.all, Skill.all, Designer.all]).call(params[:query])
	end

	def designers
		@designer = Designer.search_everywhere(params[:query]).current_page(params[:page]) 
	end 

	def tags
		@shots = Tag.search_everywhere(params[:query]).shots.current_page(params[:page]) 
	end

	def skills
		@designers = Skill.search_everywhere(params[:query]).designers.current_page(params[:page])
	end 

	private

end