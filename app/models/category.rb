class Category < ActiveRecord::Base
  attr_accessible :name, :quiz_id

  has_many :questions
  belongs_to :quiz
end
