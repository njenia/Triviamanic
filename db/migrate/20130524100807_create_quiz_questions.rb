class CreateQuizQuestions < ActiveRecord::Migration
  def change
    create_table :quiz_questions do |t|
      t.references :question

      t.timestamps
    end
    add_index :quiz_questions, :question_id
  end
end
