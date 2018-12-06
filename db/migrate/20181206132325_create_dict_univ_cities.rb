class CreateDictUnivCities < ActiveRecord::Migration[5.1]
  def change
    create_table :dict_univ_cities do |t|
      t.string :name
      t.string :description
      t.string :category
      t.string :ctype

      t.timestamps
    end
  end
end
