class AddTrazadorGoalToIndicators < ActiveRecord::Migration[5.1]
  def change
    add_column :indicators, :trazador_goal, :boolean
  end
end
