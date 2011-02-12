class CreateMatingApinaries < ActiveRecord::Migration
  def self.up
    create_table :mating_apinaries do |t|
      t.string  :name
      t.decimal :lat
      t.decimal :lon
      t.text    :address
      t.integer :free_places
      t.integer :used_places
  
      t.timestamps
    end
  end

  def self.down
    drop_table :mating_apinaries
  end
end
