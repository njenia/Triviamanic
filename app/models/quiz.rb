class Quiz < ActiveRecord::Base
  attr_accessible :user_id

  has_many :categories
  has_many :games
  belongs_to :user
end

