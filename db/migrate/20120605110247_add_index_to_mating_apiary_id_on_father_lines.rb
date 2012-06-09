class AddIndexToMatingApiaryIdOnFatherLines < ActiveRecord::Migration
  def change
    add_index :father_lines, :mating_apiary_id
  end
end
