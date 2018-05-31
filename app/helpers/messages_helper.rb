module	MessagesHelper
	def message_checker (message,user )
		if message.user_id == user.id
			"<div class=''>
			<div class='message-wrapper  is-size-7 exp'>
			<div class='messages-header exp'>
			<span > #{ user.name }</span> 
			#{ gravatar_image_tag(message.user.email.gsub('spam', 'mdeering'), class: 'rounded ', gravatar: { size: 35 }); }
			</div>              
			#{message.body } 
			</div>
			</div>".html_safe 
		else 
		end
	end
end



