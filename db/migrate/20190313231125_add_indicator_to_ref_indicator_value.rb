class AddIndicatorToRefIndicatorValue < ActiveRecord::Migration[5.1]
  def change
    add_reference :ref_indicator_values, :indicator, foreign_key: true
  end
end
