class MessagesController < ApplicationController
  before_action :authenticate_user!
  layout 'designer'
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
  #redirect_to conversation_messages_path(@conversation)
  respond_to do |format|
    if @message.save
      format.json do
        Pusher.trigger(@conversation.id.to_s, 'new', {
          text: @message.body,
          user_name: @message.user
        })
         render json: @message
      end
    else
      format.html { render :new }
      format.json { render json: @message.errors, status: :unprocessable_entity }
    end
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
