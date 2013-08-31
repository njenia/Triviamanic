class CreateGamePlayerGroups < ActiveRecord::Migration
  def change
    create_table :game_player_groups do |t|
      t.integer :quiz_id
      t.integer :player_group_id
      t.integer :score

      t.timestamps
    end
  end
end
