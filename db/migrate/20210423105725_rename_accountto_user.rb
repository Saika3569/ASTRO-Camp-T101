class RenameAccounttoUser < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :account, :email
  end
end
