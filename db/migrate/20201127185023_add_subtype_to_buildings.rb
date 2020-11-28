class AddSubtypeToBuildings < ActiveRecord::Migration[6.0]
  def up
    execute <<-SQL
      CREATE TYPE building_type AS ENUM('house', 'complex', 'commercial');
    SQL
    add_column :buildings, :subtype, :building_type
  end

  def down
    remove_column :buildings, :subtype
    execute <<-SQL
      DROP TYPE building_type
    SQL
  end
end
