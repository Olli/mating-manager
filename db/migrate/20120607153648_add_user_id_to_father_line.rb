class AddUserIdToFatherLine < ActiveRecord::Migration
  def change
    add_column :father_lines, :user_id, :integer
    add_index :father_lines, :user_id
  end
end
