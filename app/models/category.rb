class Category < ActiveRecord::Base
  attr_accessible :name, :quiz_id

  validates_presence_of :name

  has_many :questions
  belongs_to :quiz
end

