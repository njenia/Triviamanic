class QuizQuestionsController < ApplicationController

  def create
    @question = Question.find(params[:question_id])
    @quiz = Quiz.find(params[:quiz_id])
    @category = @quiz.categories.where(:name => params[:category_name]).first
    @category.quiz_questions.create(:question_id => @question.id, :quiz_id => @quiz.id)
    respond_to do |format|
      format.js
    end
  end

  def destroy

  end
end
