require 'miro'
class ColorManeger

	def initialize(shot)
		@shot = shot
	end

	def  find_color 
		colors = Miro::DominantColors.new(@shot.user_shot)
		puts colors.to_hex
	end

end