class PlayerGroupUsersController < ApplicationController

  def create
    PlayerGroupUser.create(:game_player_group_id => params[:game_player_group_id],
      :user_id => params[:id])

    render :nothing => true
  end

  def destroy
    PlayerGroupUser.where('game_player_group_id = ?', params[:game_player_group_id]).destroy_all(:user_id => params[:user_id])

    render :nothing => true
  end
end

