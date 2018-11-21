class CreateDictionaryObjetives < ActiveRecord::Migration[5.1]
  def change
    create_table :dictionary_objetives do |t|
      t.string :name
      t.text :description
      t.string :source

      t.timestamps
    end
  end
end
