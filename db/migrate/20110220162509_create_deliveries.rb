class CreateDeliveries < ActiveRecord::Migration
  def self.up
    create_table :deliveries do |t|
      t.integer :user_id
      t.integer :mating_apiary_id
      t.integer :mating_unit_id
      t.integer :amount
      t.date    :incomedate
      t.date    :pickupdate
      t.string  :state, :default => "requested"
      t.timestamps
    end
  end

  def self.down
    drop_table :delivery
  end
end
