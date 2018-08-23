class AddGoalToGoalCities < ActiveRecord::Migration[5.1]
  def change
    add_column :goal_cities, :goal, :float
  end
end
