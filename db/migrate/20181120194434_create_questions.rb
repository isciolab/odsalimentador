class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.string :name
      t.text :description
      t.boolean :available

      t.timestamps
    end
  end
end
