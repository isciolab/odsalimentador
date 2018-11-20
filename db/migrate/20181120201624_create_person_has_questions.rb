class CreatePersonHasQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :person_has_questions do |t|
      t.text :answer

      t.timestamps
    end
  end
end
