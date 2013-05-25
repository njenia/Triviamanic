class QuizzesController < ApplicationController

  def new
    @quiz = Quiz.create(:user_id => current_user.id)
    flash[:success] = 'New quiz added!'
    redirect_to edit_quiz_path(@quiz)
  end

  def edit
    @quiz = Quiz.find(params[:id])
  end
end
