class CreateQuestionAttachments < ActiveRecord::Migration
  def change
    create_table :question_attachments do |t|
      t.integer :question_id

      t.timestamps
    end
  end
end

