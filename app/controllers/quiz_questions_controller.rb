class QuizQuestionsController < ApplicationController

  def create
    @question = Question.find(params[:question_id])
    @category = Category.find(params[:category_id])
    @quiz_question = @category.quiz_questions.create(:question_id => @question.id)
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @quiz_question_id = params[:id]
    QuizQuestion.find(@quiz_question_id).destroy
    respond_to do |format|
      format.js
    end
  end
end
