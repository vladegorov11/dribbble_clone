class HuesController < ApplicationController

	def show
		@hue = Hue.find_by(name: params[:id])
    @shots = @hue.shots.current_page(params[:page])
	end
	
end