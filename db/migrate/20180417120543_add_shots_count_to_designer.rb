class AddShotsCountToDesigner < ActiveRecord::Migration[5.1]
  def change
  	add_column :designers, :shots_count, :integer, default: 0
  end
end
