class ShotPolicy
  attr_reader :current_user, :model

  def initialize(current_user, model)
    @user = current_user
    @shot = model
  end

  def show?
    true
  end

  def index?
    true
  end

  def create?
    @user.designer.present? 
  end

  def new?
    @user.designer.present?
  end

  def update?
    @shot.designer_id == @user.designer.id or @user.admin?
  end

  def edit?
  	@shot.designer_id == @user.designer.id or @user.admin?
  end

  def destroy?
    @shot.designer_id == @user.designer.id or @user.admin?
  end

  

  private 

end