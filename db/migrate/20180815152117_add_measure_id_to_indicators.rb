class AddMeasureIdToIndicators < ActiveRecord::Migration[5.1]
  def change
    add_reference :indicators, :measure, foreign_key: true
  end
end
