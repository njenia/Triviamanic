class Question < ActiveRecord::Base
  attr_accessible :instructions, :user_id

  belongs_to :user
  has_many :question_images
  has_many :quiz_questions
end
