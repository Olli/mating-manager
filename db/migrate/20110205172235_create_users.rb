class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :email
      t.string :password_hash
      t.string :password_salt
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
