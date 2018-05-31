class AddCommentsCountToShot < ActiveRecord::Migration[5.1]
  def change
  	add_column :shots, :comments_count, :integer, default: 0
  end
end
