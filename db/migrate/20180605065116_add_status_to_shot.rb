class AddStatusToShot < ActiveRecord::Migration[5.1]
  def change
  	add_column :shots, :status, :string
  end
end
