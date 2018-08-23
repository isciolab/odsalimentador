class UpdateColumsIndicatorValue < ActiveRecord::Migration[5.1]
  def change
    rename_column :indicator_values, :from, :date_from
    rename_column :indicator_values, :to, :date_to
    rename_column :indicator_values, :value, :score
    change_column :indicator_values, :score, :float
  end
end
