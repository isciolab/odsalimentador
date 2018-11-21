class CreateDataObjetives < ActiveRecord::Migration[5.1]
  def change
    create_table :data_objetives do |t|
      t.string :city
      t.string :answer_year
      t.text :response

      t.timestamps
    end
  end
end
