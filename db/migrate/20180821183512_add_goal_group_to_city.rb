class AddGoalGroupToCity < ActiveRecord::Migration[5.1]
  def change
    add_reference :cities, :goal_group, foreign_key: true
  end
end
