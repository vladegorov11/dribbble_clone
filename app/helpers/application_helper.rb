module ApplicationHelper
	def tags_list(tags)
		raw @shot.tags.map(&:name).map{|tag| 
			link_to "<span class='tag  is-size-7'>#{tag}</span>".html_safe, tag_path(tag)}.join(' ')
	end

	def verbose_date(date)
		date.strftime('%B %d %Y %T')
	end
end
