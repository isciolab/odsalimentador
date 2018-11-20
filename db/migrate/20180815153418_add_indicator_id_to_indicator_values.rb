class AddIndicatorIdToIndicatorValues < ActiveRecord::Migration[5.1]
  def change
    add_reference :indicator_values, :indicator, foreign_key: true
  end
end
