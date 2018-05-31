class ConversationsController < ApplicationController
	before_action :authenticate_user!
	layout :designer?
	def index
		@designer =  current_user.designer if current_user.designer.present?
		@conversations = Conversation.where("sender_id = ? OR recipient_id = ?", current_user.id, current_user.id)
	 end

	def create
		if Conversation.between(params[:sender_id],params[:recipient_id]).present?
			@conversation = Conversation.between(params[:sender_id],
			params[:recipient_id]).first
		else
			@conversation = Conversation.create!(conversation_params)
		end
		redirect_to conversation_messages_path(@conversation)
	end

private
	def conversation_params
		params.permit(:sender_id, :recipient_id)
	end

	def designer?
		current_user.designer.present? ? 'communion.html.erb' : 'application.html.erb'
	end
	

end