class Shot < ApplicationRecord

  include Filterable
  SHOT_STATUS = ["Publish", "Reject", "Created"]
  belongs_to     :designer, counter_cache: true
  mount_uploader :user_shot, UserShotUploader
  has_many       :comments, dependent: :destroy
  has_many       :taggings, dependent: :destroy
  has_many       :tags, through: :taggings
  has_many       :reports, as: :reportable
  before_create  :my_valid
  validates      :user_shot, presence: true
  validates      :title, presence: true, length: { in: 6..100 }
  validates      :description, presence: true,  length: { in: 20..1000 }
  #validate       :my_valid
  validates      :status, inclusion: { in: SHOT_STATUS, message: "%{value} is not a valid status" }
  is_impressionable counter_cache: true
  
  #JOB_TYPES = ["Full-time", "Part-time", "Contract", "Freelance"]
  
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
    if self.designer.shots.count > 10
      false 
    end
  end


  # t.string "title"
  # t.text "description"
  # t.integer "designer_id"
  # t.datetime "created_at", null: false
  # t.datetime "updated_at", null: false
  # t.string "user_shot"
end
