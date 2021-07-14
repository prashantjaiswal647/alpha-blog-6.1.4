class AddAdminToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :admin, :boolean, default: false # Add admin column to users table that is a boolean and is default set to false
  end
end
