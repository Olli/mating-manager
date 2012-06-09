class AddStateToFatherLines < ActiveRecord::Migration
  def change
    add_column :father_lines, :state, :string
    add_index :father_lines, :state
  end
end
