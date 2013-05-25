class Quiz < ActiveRecord::Base
  attr_accessible :user_id

  has_many :quiz_questions
  has_many :questions, :through => :quiz_questions
  has_many :categories

  belongs_to :user
end
