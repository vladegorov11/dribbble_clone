module ConversationsHelper 
	def unread_message_count conversation
		"<span class='tag is-success '><span class='icon'>
		#{conversation.messages.unread_message_count(current_user)}
		</span><span class='vote_count'><i class='fa fa-envelope'></i>
		</span></span>".html_safe if conversation.messages.unread_message_count(current_user) != 0
	end
end
