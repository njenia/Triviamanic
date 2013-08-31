class CreatePlayerGroupUsers < ActiveRecord::Migration
  def change
    create_table :player_group_users do |t|
      t.integer :player_group_id
      t.integer :user_id

      t.timestamps
    end
  end
end
