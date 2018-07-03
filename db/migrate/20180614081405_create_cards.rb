class CreateCards < ActiveRecord::Migration[5.1]
  def change
    create_table :cards do |t|
      t.string  :number 
      t.integer :month
      t.integer :year
      t.integer :cvv
      t.integer :designer_id, index: true
      t.timestamps
    end
  end
end
