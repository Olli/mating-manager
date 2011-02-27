class CreateUsedPlaces < ActiveRecord::Migration
  def self.up
    create_table :used_places do |t|
      t.integer :mating_apiary_id
      t.integer :mating_unit_id
      t.integer :deliverer_id
      t.string  :identifier
      t.timestamps
    end
  end

  def self.down
    drop_table :used_places
  end
end
