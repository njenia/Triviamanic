class Game < ActiveRecord::Base
  attr_accessible :complete, :quiz_id, :winner_id
end
