class AddGroupCitiesIdToCities < ActiveRecord::Migration[5.1]
  def change
    add_reference :cities, :group_cities, foreign_key: true
  end
end
