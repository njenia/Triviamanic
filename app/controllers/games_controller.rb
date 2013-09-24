class GamesController < ApplicationController
  def new
    @game = Game.create(:quiz_id => params[:quiz_id])
    redirect_to edit_quiz_game_path(Quiz.find(params[:quiz_id]), @game)
  end

  def edit
    @game = Game.find(params[:id])
  end

  def show
    @game = Game.find(params[:id])

    if @game.complete?
      show_game_results
    elsif @game.group_id_in_turn.nil?
      start
  elsif @game.questions_played.split(',').length - 1 == @game.quiz.questions.length
      @game.complete = true
      @game.save
      show_game_results
    else
      board
    end
  end

  def show_game_results
    @game = Game.find(params[:id])
    @game_leader = @game.game_leader

    render 'game_results'
  end

  def start
    @game.update_attributes(:group_id_in_turn => @game.game_player_groups.first.id,
                            :questions_played => '')

    redirect_to "/games/#{@game.id}"
  end

  def board
    render 'game_board'
  end

  def try_question
    @game = Game.find(params[:game_id])
    @category = Category.find(params[:category_id])
    @question = Question.find(params[:question_id])
    @question_played_first_time = false

    @attached_image_files = @question.question_attachments.where("image_file_name is not null")
    @attached_sound_files = @question.question_attachments.where("audio_file_name is not null")

    if not @game.was_question_played? @question.id
      @game.add_question_played @question.id
      @question_played_first_time = true
    end

    render 'try_question'
  end

  def solved_question
    @game = Game.find(params[:game_id])
    @category = Category.find(params[:category_id])
    @question = Question.find(params[:question_id])

    # Add points to the playing group
    group_in_turn = @game.game_player_groups.find(@game.group_id_in_turn)
    group_in_turn.score += params[:points].to_i
    group_in_turn.save

    # Advance to next group
    @game.next_group!

    redirect_to "/games/#{@game.id}"
  end
end

