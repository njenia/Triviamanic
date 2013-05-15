class CreateQuestionImages < ActiveRecord::Migration
  def change
    create_table :question_images do |t|
      t.integer :question_id

      t.timestamps
    end
  end
end
