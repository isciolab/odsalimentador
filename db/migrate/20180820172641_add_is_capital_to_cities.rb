class AddIsCapitalToCities < ActiveRecord::Migration[5.1]
  def change
    add_column :cities, :is_capital, :boolean
  end
end
