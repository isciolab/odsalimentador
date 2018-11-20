class AddTargetIdToIndicators < ActiveRecord::Migration[5.1]
  def change
    add_reference :indicators, :target, foreign_key: true
  end
end
