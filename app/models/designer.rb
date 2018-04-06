class Designer < ApplicationRecord
  
  has_many   :shots, dependent: :destroy
  belongs_to :user
  has_many   :abilities
  has_many   :skills, through: :abilities
  has_many   :follows
  has_many   :users, through: :follows 

  validates :name, presence: true, uniqueness: true, length: { in: 6..30 }
  validates :description, presence: true, length: { in: 50..250 }

  def all_skills
    self.skills.map(&:name).join(', ')
  end

  def all_skills=(name)
    self.skills = name.split(',').map {|name| Skill.where(name: name.strip).first_or_create!}
  end

  def follow user 
    Follow.create(user_id: user.id, designer_id: self.id)
  end

  def unfollow user 
    self.users.destroy(user)
  end

  def follow? user 
    self.users.include?(user) ? true : false 
  end
end
