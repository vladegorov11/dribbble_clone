module DesignersHelper
	def more_from_designer (designer, count)
		designer.shots.take(count)
	end
end
