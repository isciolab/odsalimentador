class AddCityIdToGoalCities < ActiveRecord::Migration[5.1]
  def change
    add_reference :goal_cities, :city, foreign_key: true
  end
end
