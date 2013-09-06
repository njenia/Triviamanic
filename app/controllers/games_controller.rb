class GamesController < ApplicationController
  def new
    @game = Game.create(:quiz_id => params[:quiz_id])
    redirect_to edit_quiz_game_path(Quiz.find(params[:quiz_id]), @game)
  end

  def edit
    @game = Game.find(params[:id])
  end

  def start
    @game = Game.find(params[:game_id])

    @game.update_attributes(:group_id_in_turn => @game.game_player_groups.first.id)

    redirect_to "/games/#{@game.id}/game_board"
  end

  def board
    @game = Game.find(params[:game_id])

    render 'game_board'
  end
end

