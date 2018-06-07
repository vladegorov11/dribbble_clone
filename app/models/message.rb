class Message < ActiveRecord::Base
	belongs_to :conversation
	belongs_to :user
	validates_presence_of :body, :conversation_id, :user_id
	
	def message_time
		created_at.strftime("%m/%d/%y at %l:%M %p")
	end

	scope :unread_message_count, -> (user) do 
		where('read = ? ', false).where("user_id != ?",user.id ).count
	end
end

