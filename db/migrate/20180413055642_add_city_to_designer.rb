class AddCityToDesigner < ActiveRecord::Migration[5.1]
  def change
  	add_column :designers, :city, :string
  	add_column :designers, :phone, :string
  end
end
