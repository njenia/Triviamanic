class AddBootcampNoticeCancelledToUser < ActiveRecord::Migration
  def change
    add_column :users, :bootcamp_notice_cancelled, :boolean, :default => false, :null => false
  end
end

