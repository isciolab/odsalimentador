class CreateIndicatorValues < ActiveRecord::Migration[5.1]
  def change
    create_table :indicator_values do |t|
      t.string :value
      t.date :from
      t.date :to

      t.timestamps
    end
  end
end
