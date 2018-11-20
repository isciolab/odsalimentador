class AddGoalIdToTargets < ActiveRecord::Migration[5.1]
  def change
    add_reference :targets, :goal, foreign_key: true
  end
end
