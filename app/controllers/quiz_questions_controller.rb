class QuizQuestionsController < ApplicationController

  def create
    @quiz = Quiz.find(params[:quiz_id])
    @category = @quiz.categories.where(:name => params[:category_name]).first
    @category.quiz_questions.create(:question_id => params[:question_id])
    respond_to do |format|
      format.js
    end
  end

  def destroy

  end
end
