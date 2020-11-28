class AddDescriptionToBuilding < ActiveRecord::Migration[6.0]
  def change
    add_column :buildings, :description, :hstore, default: {}, null: false
  end
end
