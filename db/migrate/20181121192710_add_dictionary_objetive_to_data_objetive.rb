class AddDictionaryObjetiveToDataObjetive < ActiveRecord::Migration[5.1]
  def change
    add_reference :data_objetives, :dictionary_objetive, foreign_key: true
  end
end
