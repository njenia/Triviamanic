class Category < ActiveRecord::Base
  attr_accessible :name

  belongs_to :quiz
  has_many :quiz_questions
end
