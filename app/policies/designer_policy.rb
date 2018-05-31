class DesignerPolicy
  attr_reader :current_user, :model

  def initialize(current_user, model)
    @user = current_user
    @designer = model
  end

  def show?
    true
  end

  def index?
    true
  end

  def create?
    @user.designer.blank? or @user.admin?
  end

  def new?
    @user.designer.blank? or @user.admin?
  end

  def update?
    @designer.user_id == @user.id or @user.admin?
  end

  def edit?
  	@designer.user_id == @user.id or @user.admin?
  end

  def destroy?
    @designer.user_id == @user.id or @user.admin?
  end

  def follow?
    @designer.user_id != @user.id
  end

  def unfollow?
    @designer.user_id != @user.id
  end

  private 

end