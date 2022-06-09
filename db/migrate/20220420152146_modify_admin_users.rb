class ModifyAdminUsers < ActiveRecord::Migration[6.0]
  def change
    rename_table :admin_users, :users
    add_column :users, :is_admin, :boolean, index: true, default: false
    add_index :users, :name
  end
end
