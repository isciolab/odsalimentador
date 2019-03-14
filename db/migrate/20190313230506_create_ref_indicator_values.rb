class CreateRefIndicatorValues < ActiveRecord::Migration[5.1]
  def change
    create_table :ref_indicator_values do |t|
      t.float :referenceone
      t.float :referencetwo

      t.timestamps
    end
  end
end
