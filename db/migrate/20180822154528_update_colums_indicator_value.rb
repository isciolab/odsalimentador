class UpdateColumsIndicatorValue < ActiveRecord::Migration[5.1]
  def up
    rename_column :indicator_values, :from, :date_from
    rename_column :indicator_values, :to, :date_to
    rename_column :indicator_values, :value, :score
    change_column :indicator_values, :score, :float
  end
  def down
    rename_column :indicator_values, :date_from, :from
    rename_column :indicator_values, :date_to, :to
    rename_column :indicator_values, :score, :value
    change_column :indicator_values, :value, :string
  end
end
