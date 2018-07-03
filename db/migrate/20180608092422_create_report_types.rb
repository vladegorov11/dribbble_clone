class CreateReportTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :report_types do |t|
      t.string :name 
      t.integer :report_id, index: true
      t.timestamps
    end
  end
end
