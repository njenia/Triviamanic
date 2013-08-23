class Question < ActiveRecord::Base
  attr_accessible :instructions, :category_id

  belongs_to :category
  has_many :question_images
end

