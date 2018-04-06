class CreateDesigners < ActiveRecord::Migration[5.1]
  def change
    create_table :designers do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
