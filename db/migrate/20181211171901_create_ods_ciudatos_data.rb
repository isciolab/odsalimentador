class CreateOdsCiudatosData < ActiveRecord::Migration[5.1]
  def change
    create_table :ods_ciudatos_data do |t|
      t.text :objetive
      t.text :target
      t.text :indicator
      t.string :city
      t.text :response
      t.string :source
      t.string :symbol

      t.timestamps
    end
  end
end
