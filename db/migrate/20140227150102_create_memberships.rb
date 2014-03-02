class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.string :name
      t.string :swag
      t.decimal :prereg_fee
      t.decimal :reg_fee
      t.references :furcon, index: true

      t.timestamps
    end
  end
end