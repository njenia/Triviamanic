class Game < ActiveRecord::Base
  attr_accessible :complete, :quiz_id, :winner_id, :group_id_in_turn, :questions_played

  belongs_to :quiz
  has_many :game_player_groups

  def was_question_played?(question_id)
    self.questions_played.split(',').map{|question_id| question_id.to_i}.include? question_id
  end

  def add_question_played(question_id)
    self.questions_played += ",#{question_id}"
    self.save
  end

  def next_group!
    groups_ids = self.game_player_groups.select(:id).order(:id).collect{|group| group.id}
    self.group_id_in_turn = groups_ids[(groups_ids.index(self.group_id_in_turn) + 1) % groups_ids.length]
    self.save
  end

  def game_leader
    max_score = self.game_player_groups.maximum(:score)
    self.game_player_groups.where(:score => max_score)
  end
end

