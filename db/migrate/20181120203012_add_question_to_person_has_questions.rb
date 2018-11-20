class AddQuestionToPersonHasQuestions < ActiveRecord::Migration[5.1]
  def change
    add_reference :person_has_questions, :question, foreign_key: true
  end
end
