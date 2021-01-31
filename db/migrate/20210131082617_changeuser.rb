class Changeuser < ActiveRecord::Migration[6.0]
  def change
    remove_column :tasks, :tag
    rename_column :tasks, :aasm_state, :state
  end
end
