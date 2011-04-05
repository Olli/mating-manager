class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      #devise
      t.database_authenticatable
      t.confirmable
      t.recoverable
      t.rememberable
      t.trackable

      # for omniauth
      t.string :provider
      t.string :uid
      # address for billing informations
      t.string :first_name
      t.string :last_name
      t.string :street
      t.string :house_number
      t.string :zip
      t.string :city
      t.integer :country_id

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
