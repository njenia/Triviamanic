class CreateGamePlayerGroups < ActiveRecord::Migration
  def change
    create_table :game_player_groups do |t|
      t.integer :game_id
      t.integer :score

      t.timestamps
    end
  end
end

