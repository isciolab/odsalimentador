class AddCtypeDataObjetiva < ActiveRecord::Migration[5.1]
  def change
    add_column :dictionary_objetives, :ctype, :string
  end
end
