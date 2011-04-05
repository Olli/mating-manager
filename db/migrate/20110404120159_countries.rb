class Countries < ActiveRecord::Migration
  def self.up
    create_table :countries do |t|
      t.string :code, :name
    end
    
    add_index :countries, :code
    add_index :countries, :name
  end
  
  def self.down
    drop_table :countries
  end  

end
