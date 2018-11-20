class CreatePeople < ActiveRecord::Migration[5.1]
  def change
    create_table :people do |t|
      t.string :sex
      t.string :city
      t.string :age
      t.string :answer_year
      t.string :unique_id
      t.string :stratum
      t.string :location
      t.string :zone

      t.timestamps
    end
  end
end
