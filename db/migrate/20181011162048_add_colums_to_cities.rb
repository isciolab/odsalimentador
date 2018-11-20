class AddColumsToCities < ActiveRecord::Migration[5.1]
  def change
    add_column :cities, :urban_population, :float
    add_column :cities, :rural_population, :float
    add_column :cities, :total_area, :string
    add_column :cities, :foundation_year, :year
  end
end
