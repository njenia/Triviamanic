class QuestionAttachment < ActiveRecord::Base
  attr_accessible :question_id, :audio, :image

  belongs_to :question

  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  has_attached_file :audio
end

