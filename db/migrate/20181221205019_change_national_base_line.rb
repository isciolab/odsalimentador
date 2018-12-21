class ChangeNationalBaseLine < ActiveRecord::Migration[5.1]
  def up
    change_column :indicators, :national_base_line, :float
  end
  def down
    change_column :indicators, :national_base_line, :float
  end
end
