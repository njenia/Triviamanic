class QuestionsController < ApplicationController

  respond_to :html

  def index
    @questions = Question.all
    @user = User.find(params[:user_id])
  end

  def new
    @category = Category.find(params[:category_id])
    max_points_in_category = @category.questions.maximum("points")
    if max_points_in_category == nil
      max_points_in_category = 0
    end
    @question = Question.create(:category_id => @category.id, :points => max_points_in_category + 100,
                  :time_limit => 180)

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
    @time_limits = [["10s", 10], ["30s", 30], ["1m", 60], ["3m", 180], ["5m", 300], ["10m", 600], ["No time limit", -1]]

    if @category.quiz.user != current_user or @question.category != @category
      flash[:failure] = "Access denied"
      redirect_to root_path
    end
  end

  def update
    question = Question.find(params[:id])
    question.update_attributes(params[:question])
    if question.save
      flash[:success] = "Question saved"
    end
    redirect_to edit_quiz_path(question.category.quiz)
  end

  def destroy
    question = Question.find(params[:id])
    quiz = question.category.quiz
    question.destroy

    #redirect_to edit_quiz_path(quiz)
    redirect_to reorder_category_path(question.category.id)
  end
end

