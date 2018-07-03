class MessagesController < ApplicationController
  before_action :authenticate_user!
  layout 'designer.html.erb' 
  before_action do
   @conversation = Conversation.find(params[:conversation_id])
  end
def index
  @designer =  current_user.designer if current_user.designer.present?
  authorize @conversation 
  @messages = @conversation.messages
  if @messages.length > 10
   @over_ten = true
   @messages = @messages[-10..-1]
  end
  if params[:m]
   @over_ten = false
   @messages = @conversation.messages
  end
  read_update @messages
@message = @conversation.messages.new
 end
def new
 @message = @conversation.messages.new
end
def create
 @message = @conversation.messages.new(message_params)
 if @message.save
  redirect_to conversation_messages_path(@conversation)
 end
end
private
 def message_params
  params.require(:message).permit(:body, :user_id)
 end

 def read_update messages 
    messages.each do |msg| 
      msg.update(read: true) if msg.user_id != current_user.id
    end
 end

end