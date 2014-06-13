class ChangeColumnsToUserid < ActiveRecord::Migration
  def change
    remove_column :questions, :user_name
    remove_column :answers, :user_name
    add_column :questions, :user_id, :integer, null: false
    add_column :answers, :user_id, :integer, null: false
  end
end
