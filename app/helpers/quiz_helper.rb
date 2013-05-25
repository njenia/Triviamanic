module QuizHelper
  def is_question_in_quiz(quiz, question)
    not quiz.quiz_questions.where(:question_id => question.id).first.nil?
  end
end
