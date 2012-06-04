class AddUserIdToMatingApiaries < ActiveRecord::Migration
  def change
    add_column :mating_apiaries, :user_id, :integer
    add_index :mating_apiaries, :user_id
  end
end
