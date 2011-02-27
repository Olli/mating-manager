class CreateDeliverers < ActiveRecord::Migration
  def self.up
    create_table :deliverers do |t|
      t.integer :user_id
      t.integer :mating_apiary_id
      t.text :address
      t.timestamps
    end
  end

  def self.down
    drop_table :deliverers
  end
end
