class ChangeNameIndicatorToText < ActiveRecord::Migration[5.1]
  def up
    change_column :indicators, :name, :text
  end
  def down
    change_column :indicators, :name, :string
  end
end
