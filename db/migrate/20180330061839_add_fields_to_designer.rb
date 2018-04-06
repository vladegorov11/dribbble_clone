class AddFieldsToDesigner < ActiveRecord::Migration[5.1]
  def change
    add_column :designers, :instagram_link, :string
    add_column :designers, :facebook_lonk, :string
    add_column :designers, :twitter_link, :string
  end
end
