class AddColumsToCity < ActiveRecord::Migration[5.1]
  def change
    add_column :cities, :rccv_program, :string
    add_column :cities, :total_population, :int
    add_column :cities, :metropolitan_area, :string
    add_column :cities, :city_system_dnp, :string
    add_column :cities, :dnp_category, :string
    add_column :cities, :ddt_typology, :string
  end
end
