class AddCountryIdToDepartments < ActiveRecord::Migration[5.1]
  def change
    add_reference :departments, :country, foreign_key: true
  end
end
