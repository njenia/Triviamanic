class QuestionAttachmentsController < ApplicationController
  def create
    attachment = params[:attachment]
    if attachment.content_type == 'audio/mp3'
      @question_attachment = QuestionAttachment.create(:audio => attachment, :question_id => params[:question_id])
    elsif attachment.content_type.include? 'image'
      @question_attachment = QuestionAttachment.create(:image => attachment, :question_id => params[:question_id])
    end

    respond_to do |format|
      format.js
    end
  end

end

