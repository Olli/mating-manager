class CreateFatherLines < ActiveRecord::Migration
  def self.up
    create_table :father_lines do |t|
      t.string :name 
      t.string :race
      t.text :description
      t.integer :mating_apiary_id
      t.date :startdate
      t.date :enddate
      t.timestamps
    end
  end

  def self.down
    drop_table :father_lines
  end
end
