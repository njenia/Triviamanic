class AddQuizQuestionsToQuizzes < ActiveRecord::Migration
  def change
    add_column :quizzes, :quiz_questions_id, :integer
  end
end
