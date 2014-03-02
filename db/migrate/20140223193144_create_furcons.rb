class CreateFurcons < ActiveRecord::Migration
  def change
    create_table :furcons do |t|
      t.string :name
      t.string :website
      t.string :location
      t.string :theme
      t.date :starts_on
      t.date :ends_on

      t.timestamps
    end
  end
end
