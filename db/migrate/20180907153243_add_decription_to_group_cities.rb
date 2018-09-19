class AddDecriptionToGroupCities < ActiveRecord::Migration[5.1]
  def change
    add_column :group_cities, :description, :text
  end
end
