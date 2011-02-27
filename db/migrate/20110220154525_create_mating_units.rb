class CreateMatingUnits < ActiveRecord::Migration
  def self.up
    create_table :mating_units do |t|
      t.string :name
      
      t.timestamps
    end
  end

  def self.down
    drop_table :mating_units
  end
end
