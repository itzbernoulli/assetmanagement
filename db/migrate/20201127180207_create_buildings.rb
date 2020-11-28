class CreateBuildings < ActiveRecord::Migration[6.0]
  def change
    create_table :buildings do |t|
      t.string :owner
      t.string :address
      t.integer :sqmt
      t.float :price

      t.timestamps
    end
  end
end