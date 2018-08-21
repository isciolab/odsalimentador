class CreateGoalCities < ActiveRecord::Migration[5.1]
  def change
    create_table :goal_cities do |t|
      t.float :score
      t.date :date

      t.timestamps
    end
  end
end
