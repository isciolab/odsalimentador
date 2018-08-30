class AddGoalIdToGoalCities < ActiveRecord::Migration[5.1]
  def change
    add_reference :goal_cities, :goal, foreign_key: true
  end
end
