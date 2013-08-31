class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :quiz_id
      t.boolean :complete
      t.integer :winner_id

      t.timestamps
    end
  end
end
