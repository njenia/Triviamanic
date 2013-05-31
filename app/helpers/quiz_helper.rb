module QuizHelper
  def is_question_in_quiz(quiz, question)
    not QuizQuestion.joins(:category => :quiz).where('quizzes.id' => quiz.id, 'quiz_questions.question_id' => question.id).first.nil?
  end
end
