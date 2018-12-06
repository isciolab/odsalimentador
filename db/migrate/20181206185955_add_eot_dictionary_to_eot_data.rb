class AddEotDictionaryToEotData < ActiveRecord::Migration[5.1]
  def change
    add_reference :eot_data, :eot_dictionary, foreign_key: true
  end
end
