class CreateFollows < ActiveRecord::Migration[5.1]
  def change
    create_table :follows do |t|
      t.integer :designer_id
      t.integer :user_id
      t.timestamps
    end
  end
end
