class UpdateColumDateGoalCities < ActiveRecord::Migration[5.1]
  def change
    rename_column :goal_cities, :date, :date_from
  end
end
