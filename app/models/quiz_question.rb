class QuizQuestion < ActiveRecord::Base
  attr_accessible :question_id
  belongs_to :question
  belongs_to :category
end
