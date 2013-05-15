class QuestionsController < ApplicationController

  respond_to :html

  def index
    @questions = Question.all
    @user = User.find(params[:user_id])
  end

  def new
    @question = Question.create(:user_id => params[:user_id])
    @user = User.find(params[:user_id])
    redirect_to edit_user_question_path(@user, @question)
  end

  def create
    @question = Question.find(params[:question])
    @question.save
    redirect_to user_questions_path
  end

  def edit
    @question = Question.find(params[:id])
    @user = User.find(params[:user_id])
  end

  def update
    question = Question.find(params[:id])
    question.update_attributes(params[:question])
    if question.save
      flash[:notice] = "Question saved"
    end
    redirect_to root_path
  end
end
