class AddCityIdToIndicatorValues < ActiveRecord::Migration[5.1]
  def change
    add_reference :indicator_values, :city, foreign_key: true
  end
end
