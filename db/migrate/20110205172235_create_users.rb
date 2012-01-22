class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      devise
      ## Database authenticatable
      t.string :email,              :null => false, :default => ""
      t.string :encrypted_password, :null => false, :default => ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at
    
      ## Rememberable
      t.datetime :remember_created_at
    
      ## Trackable
      t.integer  :sign_in_count, :default => 0
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip
      
      ## Confirmable
      t.string   :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      t.string   :unconfirmed_email # Only if using reconfirmable
      
      
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
