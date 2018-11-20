class CreateGoalGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :goal_groups do |t|
      t.string :name

      t.timestamps
    end
  end
end
