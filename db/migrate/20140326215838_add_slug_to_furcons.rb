class AddSlugToFurcons < ActiveRecord::Migration
  def change
    add_column :furcons, :slug, :string
  end
end
