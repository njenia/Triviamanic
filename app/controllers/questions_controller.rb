class QuestionsController < ApplicationController

  respond_to :html

  def index
    @questions = Question.all
    @user = User.find(params[:user_id])
  end

  def new
    @category = Category.find(params[:category_id])
    @question = Question.create(:category_id => @category.id)

    redirect_to edit_category_question_path(@category, @question)
  end

  def create
    @question = Question.find(params[:question])
    @question.save
    redirect_to user_questions_path
  end

  def edit
    @question = Question.find(params[:id])
    @category = Category.find(params[:category_id])
  end

  def update
    question = Question.find(params[:id])
    question.update_attributes(params[:question])
    if question.save
      flash[:success] = "Question saved"
    end
    redirect_to root_path
  end
end

