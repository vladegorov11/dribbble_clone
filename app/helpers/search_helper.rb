module SearchHelper
	def input_shots (shots, limit) 
		if shots.present?  
		" <section class='section shots-wrap' id='pagination-wrapper'>
  		<div class='columns  is-multiline '' id='shots'>
  			#{raw render partial: 'shots/shot', collection: @search[:Shot].limit(limit) , as: :shot}
  		</div>
		</section> ".html_safe 
		else 
			raw render  'shared/empty_record'
		end  
	end

	def input_designers (designers, limit)
		if designers.present?
			raw render partial: 'designers', locals: {designers: @search[:Designer].limit(limit)}
		end
	end

end


