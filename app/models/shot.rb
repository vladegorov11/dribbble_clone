class Shot < ApplicationRecord

  include Filterable

  belongs_to     :designer, counter_cache: true
  mount_uploader :user_shot, UserShotUploader
  has_many       :comments, dependent: :destroy
  has_many       :taggings, dependent: :destroy
  has_many       :tags, through: :taggings
  
  validates :user_shot, presence: true
  validates :title, presence: true, length: { in: 6..100 }
  validates :description, presence: true,  length: { in: 20..1000 }
  validate :my_valid

  is_impressionable counter_cache: true

  acts_as_votable

  scope :debut, -> { where(id: Designer.where('shots_count <= ?', 3).map {|designer| designer.shots.ids})}

  scope :following, -> { follows.shots }

  scope :default, -> { order(created_at: :desc)}

  scope :most_viewed, -> { order(impressions_count: :desc)}

  scope :most_liked, -> { order(cached_votes_up: :desc)}

  scope :most_commented, -> { order(comments_count: :desc)}

  scope :popular, -> { order(comments_count: :desc, cached_votes_up: :desc, impressions_count: :desc)}

  scope :month, -> { where(created_at: 1.month.ago..DateTime.now)}
  
  scope :year , -> {where(created_at: 1.year.ago..DateTime.now)}

  scope :week, -> {where(created_at: 1.week.ago..DateTime.now)}

  def all_tags
    self.tags.map(&:name).join(', ')
  end

  def all_tags=(name)
    self.tags = name.split(',').map {|name| Tag.where(name: name.strip).first_or_create!}
  end

  def self.per_page
    12
  end

  def my_valid
    designer = Designer.find(self.designer_id)
    puts designer.shots.count 
    if designer.shots.count > 10 
      self.errors.add(:user_shot, "You can not add more than 10 shots")
    end
  end

  

  # t.string "title"
  # t.text "description"
  # t.integer "designer_id"
  # t.datetime "created_at", null: false
  # t.datetime "updated_at", null: false
  # t.string "user_shot"
end
