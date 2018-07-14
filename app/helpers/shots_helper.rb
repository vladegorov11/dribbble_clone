module ShotsHelper
	def more_from_designer (designer, count)
		designer.shots.order("RANDOM()").limit(count)
	end
end
