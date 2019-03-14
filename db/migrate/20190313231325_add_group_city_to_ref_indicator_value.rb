class AddGroupCityToRefIndicatorValue < ActiveRecord::Migration[5.1]
  def change
    add_reference :ref_indicator_values, :group_city, foreign_key: true
  end
end
