module ApplicationHelper
	def tags_list(tags)
		raw @shot.tags.map(&:name).map{|tag| 
			link_to "<span class='tag  is-size-7'>#{tag}</span>".html_safe, tag_path(tag)}.join(' ')
	end

	def verbose_date(date)
		date.strftime('%B %d %Y %T')
	end

	def bulma_class_for(name)
		{success: "is-primary",
		 error: "is-danger",
		 danger: "is-danger",
		 alert: "is-warning",
		 notice: "is-info"
		}[name.to_sym] || name
	end
end
