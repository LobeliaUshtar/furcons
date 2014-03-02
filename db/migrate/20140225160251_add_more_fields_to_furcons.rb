class AddMoreFieldsToFurcons < ActiveRecord::Migration
  def change
    add_column :furcons, :image_file_name, :string
  end
end
