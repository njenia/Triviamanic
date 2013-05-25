class QuizQuestion < ActiveRecord::Base
  attr_accessible :question_id, :quiz_id

  belongs_to :question
  belongs_to :category
  belongs_to :quiz
end
