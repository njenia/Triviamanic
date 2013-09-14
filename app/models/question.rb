class Question < ActiveRecord::Base
  attr_accessible :question, :category_id, :time_limit, :points

  belongs_to :category
  has_many :question_attachments
end

