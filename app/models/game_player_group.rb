class GamePlayerGroup < ActiveRecord::Base
  attr_accessible :player_group_id, :game_id, :score

  belongs_to :game
  has_many :player_group_users
  has_many :users, :through => :player_group_users
end

