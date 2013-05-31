class Quiz < ActiveRecord::Base
  attr_accessible :user_id

  has_many :categories
  belongs_to :user
end
