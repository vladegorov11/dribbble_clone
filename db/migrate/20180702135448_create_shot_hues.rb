class CreateShotHues < ActiveRecord::Migration[5.1]
  def change
    create_table :shot_hues do |t|
    	t.belongs_to :shot, foreign_key: true
      t.belongs_to :hue, foreign_key: true
      t.timestamps
    end
  end
end
