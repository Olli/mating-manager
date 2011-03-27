class CreateMatingApiaries < ActiveRecord::Migration
  def self.up
    create_table :mating_apiaries do |t|
      t.string  :name
      t.decimal :lat
      t.decimal :lon
      t.text    :address
      t.boolean :enabled, :default => false
      t.timestamps
    end
  end

  def self.down
    drop_table :mating_apiaries
  end
end
