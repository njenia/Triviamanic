class QuestionImagesController < ApplicationController
  def create
    image = params[:image]
    @question_image = QuestionImage.create(:image => image, :question_id => params[:question_id])
    respond_to do |format|
      format.js
    end
  end

end
