class Shot < ApplicationRecord

  belongs_to     :designer
  mount_uploader :user_shot, UserShotUploader
  has_many       :comments, dependent: :destroy
  has_many :taggings
  has_many :tags, through: :taggings, dependent: :destroy
  is_impressionable counter_cache: true
  acts_as_votable

  def all_tags
    self.tags.map(&:name).join(', ')
  end

  def all_tags=(name)
    self.tags = name.split(',').map {|name| Tag.where(name: name.strip).first_or_create!}
  end

  scope :default, -> { order(created_at: :desc) }

  scope :most_viewed, -> { order(impressions_count: :desc) }

  scope :most_liked, -> {  order(cached_votes_up: :desc) }
  
  scope :current_page, -> (page) do
    paginate(:page => page, :per_page => per_page)
  end

  def self.per_page
    16
  end

end
