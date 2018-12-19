class ActualizaFundationYear < ActiveRecord::Migration[5.1]
  def up
    change_column :cities, :foundation_year, :string
  end
  def down
    change_column :cities, :foundation_year, :string
  end
end
