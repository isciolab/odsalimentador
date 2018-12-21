class ActualizaFechasIndicatorValue < ActiveRecord::Migration[5.1]
  def up
    change_column :indicator_values, :date_from, :string
    change_column :indicator_values, :date_to, :string
  end
  def down
    change_column :indicator_values, :date_from, :string
    change_column :indicator_values, :date_to, :string
  end
end
