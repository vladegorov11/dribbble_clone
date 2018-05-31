class SearchFilter
	def initialize(params=[])
		@params = params
		@shots = Shot.all
	end

	def scope
		if @params[:sort].blank? && @params[:date].blank?
			@shots = @shots.where(created_at: 1.week.ago..DateTime.now).default
	  else 
	  	date_time_filter
	  end
	  @params[:sort] ? @shots.send("#{@params[:sort]}") : @shots.default
	end

	def date_time_filter
		case @params[:date]
			when 'month'
				@shots = @shots.month
			when 'year'
				@shots = @shots.year
			else 
				@shots = @shots.week
		end
	end
end