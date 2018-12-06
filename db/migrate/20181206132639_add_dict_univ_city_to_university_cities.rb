class AddDictUnivCityToUniversityCities < ActiveRecord::Migration[5.1]
  def change
    add_reference :university_cities, :dict_univ_city, foreign_key: true
  end
end
