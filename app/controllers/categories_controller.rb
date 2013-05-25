class CategoriesController < ApplicationController

  def create
    quiz = Quiz.find(params[:quiz_id])
    @category = quiz.categories.create(:name => params['new_category_name'])
    respond_to do |format|
      format.js
    end
  end

  def destroy

  end
end