class CreateDictUnivCities < ActiveRecord::Migration[5.1]
  def change
    create_table :dict_univ_cities do |t|
      t.string :label
      t.string :category
      t.string :type
    end
  end
end
