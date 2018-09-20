class AddDeleteAttAllTables < ActiveRecord::Migration[5.1]
  def up
    add_column :goals, :delete_at, :datetime
    add_column :cities, :delete_at, :datetime
    add_column :countries, :delete_at, :datetime
    add_column :departments, :delete_at, :datetime
    add_column :indicators, :delete_at, :datetime
    add_column :roles, :delete_at, :datetime
    add_column :targets, :delete_at, :datetime
    add_column :users, :delete_at, :datetime
  end
  def down
    remove_column :goals, :delete_at
    remove_column :cities, :delete_at
    remove_column :countries, :delete_at
    remove_column :departments, :delete_at
    remove_column :indicators, :delete_at
    remove_column :roles, :delete_at
    remove_column :targets, :delete_at
    remove_column :users, :delete_at
  end
end
