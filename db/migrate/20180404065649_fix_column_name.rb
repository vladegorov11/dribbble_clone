class FixColumnName < ActiveRecord::Migration[5.1]
  def change
  	rename_column :designers, :facebook_lonk, :facebook_link
  end
end
