class Game < ActiveRecord::Base
  attr_accessible :complete, :quiz_id, :winner_id, :group_id_in_turn

  belongs_to :quiz
  has_many :game_player_groups
end

