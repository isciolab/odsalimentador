class RemoveDataTypeFromIndicator < ActiveRecord::Migration[5.1]
  def change
    remove_column :indicators, :data_type, :string
  end
end
