class ConversationPolicy
  attr_reader :current_user, :model

  def initialize(current_user, model)
    @user = current_user
    @model = model
  end

  def index?
    @model.sender_id == @user.id or  @model.recipient_id == @user.id
  end

end

