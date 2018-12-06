class CreateUniversityCities < ActiveRecord::Migration[5.1]
  def change
    create_table :university_cities do |t|
      t.string :city
      t.string :answer_year
      t.text :response

      t.timestamps
    end
  end
end
