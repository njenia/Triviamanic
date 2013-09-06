class GamePlayerGroupsController < ApplicationController

  def create
    @game_player_group = GamePlayerGroup.new(:game_id => params[:game_id], :score => 0)

    respond_to do |format|
      if @game_player_group.save
        format.html { redirect_to edit_quiz_game_path(@game_player_group.game.quiz, @game_player_group.game) }
        format.js
      else
        format.html { render action: "new" }
        format.js
      end
    end
  end
end

