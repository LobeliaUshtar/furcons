class AddFieldsToFurcons < ActiveRecord::Migration
  def change
    add_column :furcons, :charities, :string
    add_column :furcons, :guest_of_honor, :string
    add_column :furcons, :prereg_by, :date
  end
end
