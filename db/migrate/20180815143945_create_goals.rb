class CreateGoals < ActiveRecord::Migration[5.1]
  def change
    create_table :goals do |t|
      t.string :number
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
