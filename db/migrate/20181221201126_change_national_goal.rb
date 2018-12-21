class ChangeNationalGoal < ActiveRecord::Migration[5.1]
  def up
    change_column :indicators, :national_goal, :float
  end
  def down
    change_column :indicators, :national_goal, :float
  end
end
