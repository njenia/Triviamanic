class QuizzesController < ApplicationController

  def new
    @quiz = Quiz.create(:user_id => current_user.id)
    flash[:success] = 'New quiz added!'
    redirect_to edit_quiz_path(@quiz)
  end

  def edit
    @quiz = Quiz.find(params[:id])
  end

  def update
    @quiz = Quiz.find(params[:id])
    @quiz.update_attributes(params[:quiz])
    respond_to do |format|
      format.js
    end
  end
end
