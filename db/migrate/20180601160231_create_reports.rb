class CreateReports < ActiveRecord::Migration[5.1]
  def change
    create_table :reports do |t|
      t.string :body 
      t.integer :report_type_id, index: true
      t.integer :user_id, index: true
      t.integer :reportable_id, index: true
      t.string :reportable_type, index: true
      t.timestamps
    end
  end
end
