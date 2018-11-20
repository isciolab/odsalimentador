class CreateGroupCities < ActiveRecord::Migration[5.1]
  def change
    create_table :group_cities do |t|
      t.string :name

      t.timestamps
    end
  end
end
