class AddAttachmentToQuestionAttachments < ActiveRecord::Migration
  def self.up
    change_table :question_attachments do |t|
      t.attachment :image
      t.attachment :audio
    end
  end

  def self.down
    drop_attached_file :question_attachments, :image
    drop_attached_file :question_attachments, :audio
  end
end

