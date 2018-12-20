class AddUnidadMedidaDataObjetiva < ActiveRecord::Migration[5.1]
  def change
    add_column :dictionary_objetives, :measure, :string
  end
end
