class CreatePlaces < ActiveRecord::Migration
  def self.up
    create_table :places do |t|
      t.integer :mating_apiary_id
      t.integer :mating_unit_id
      t.integer :amount, :default => 1
      t.timestamps
    end
  end

  def self.down
    drop_table :places
  end
end
