class CreateTargets < ActiveRecord::Migration[5.1]
  def change
    create_table :targets do |t|
      t.text :name
      t.string :number
      t.boolean :available

      t.timestamps
    end
  end
end
