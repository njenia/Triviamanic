class AddCategoryToQuizQuestion < ActiveRecord::Migration
  def change
    add_column :quiz_questions, :category_id, :integer
  end
end
