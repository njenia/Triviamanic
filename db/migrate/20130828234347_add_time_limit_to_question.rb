class AddTimeLimitToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :time_limit, :integer
  end
end
