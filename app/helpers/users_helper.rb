module UsersHelper
  def user_games
    Game.
      joins("
        left outer join game_player_groups on game_player_groups.game_id = games.id
        left outer join player_group_users on game_player_groups.id = player_group_users.game_player_group_id
        left outer join users on users.id = player_group_users.user_id").
      where("users.id = ?", current_user.id).
      order("updated_at DESC")
  end
end

