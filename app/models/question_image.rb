class QuestionImage < ActiveRecord::Base
  attr_accessible :question_id, :image

  belongs_to :question_image

  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
end
