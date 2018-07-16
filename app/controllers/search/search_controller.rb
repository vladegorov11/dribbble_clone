class  Search::SearchController < ApplicationController
	
	def index
  	@search = Search.new([Tag.all, Shot.all, Skill.all, Designer.all]).call(params[:query])
	end

	def designers
		@designers = Designer.search_everywhere(params[:query]).current_page(params[:page])
	end

	def tags
		#@tags = Tag.search_everywhere(params[:query]).includes(:shots).current_page(params[:page]) 
	end

	def skills
		#@designers = Skill.search_everywhere(params[:query]).current_page(params[:page])
	end

end
