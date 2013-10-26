class AddSolutionToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :solution, :string
  end
end
