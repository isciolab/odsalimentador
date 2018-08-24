class RemoveTypeFromCities < ActiveRecord::Migration[5.1]
  def change
    remove_column :cities, :type, :string
  end
end
