class PlayerGroupUser < ActiveRecord::Base
  attr_accessible :game_player_group_id, :user_id

  belongs_to :user
  belongs_to :game_player_group

end

