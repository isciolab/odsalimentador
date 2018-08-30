class UpdateColumDateGoalCities < ActiveRecord::Migration[5.1]
  def up
    rename_column :goal_cities, :date, :date_from
  end
  def down
    rename_column :goal_cities, :date_from, :date
  end
end
