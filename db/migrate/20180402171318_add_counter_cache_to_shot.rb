class AddCounterCacheToShot < ActiveRecord::Migration[5.1]
  def change
  	add_column :shots, :impressions_count, :integer, default: 0
  end
end
