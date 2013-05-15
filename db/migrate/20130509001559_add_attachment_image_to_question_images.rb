class AddAttachmentImageToQuestionImages < ActiveRecord::Migration
  def self.up
    change_table :question_images do |t|
      t.attachment :image
    end
  end

  def self.down
    drop_attached_file :question_images, :image
  end
end
