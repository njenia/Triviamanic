class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.references :quiz
      t.string :name

      t.timestamps
    end
    add_index :categories, :quiz_id
  end
end
